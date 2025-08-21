class ApplicationController < ActionController::Base
  include VisitorTracking
  
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    # Clear session if user doesn't exist
    if session[:user_id] && @current_user.nil?
      session[:user_id] = nil
    end
    @current_user
  end

  helper_method :current_user

  def require_admin
    redirect_to root_path unless current_user&.admin?
  end
end
