module VisitorTracking
  extend ActiveSupport::Concern
  
  included do
    after_action :track_visit
  end
  
  private
  
  def track_visit
    # Skip tracking for admin dashboard and other sensitive areas
    return if skip_tracking?
    
    ip_address = request.remote_ip
    user_agent = request.user_agent
    page_path = request.path
    
    # Track the visit asynchronously to avoid slowing down the response
    TrackVisitJob.perform_later(ip_address, user_agent, page_path) if defined?(TrackVisitJob)
    
    # Also track synchronously for immediate availability
    IpVisitor.track_visit(ip_address, user_agent, page_path)
  rescue => e
    Rails.logger.error "Failed to track visit: #{e.message}"
  end
  
  def skip_tracking?
    # Skip tracking for admin areas, API calls, and asset requests
    request.path.start_with?('/admin') ||
    request.path.start_with?('/api') ||
    request.path.start_with?('/assets') ||
    request.path.start_with?('/images') ||
    request.path.start_with?('/javascripts') ||
    request.path.start_with?('/stylesheets') ||
    request.xhr? ||
    request.format.json?
  end
end 