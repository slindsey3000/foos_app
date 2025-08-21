class Admin::VisitorStatsController < ApplicationController
  before_action :require_admin
  
  def index
    @total_visitors = IpVisitor.count
    @total_page_visits = PageVisit.count
    @recent_visitors = IpVisitor.recent.limit(20)
    @most_visited_ips = IpVisitor.most_visited.limit(10)
    
    # Get page visit statistics
    @page_visits_by_path = PageVisit.group(:page_path)
                                   .count
                                   .sort_by { |_, count| -count }
                                   .first(10)
    
    # Get recent page visits
    @recent_page_visits = PageVisit.includes(:ip_visitor)
                                  .recent
                                  .limit(20)
    
    # Get visitor activity by day (last 7 days)
    @visitors_by_day = IpVisitor.where('last_visit >= ?', 7.days.ago)
                               .group("DATE(last_visit)")
                               .count
                               .sort_by { |date, _| date }
  end
  
  def show
    @visitor = IpVisitor.find(params[:id])
    @page_visits = @visitor.page_visits.recent.limit(50)
  end
end 