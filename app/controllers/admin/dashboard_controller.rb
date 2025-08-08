class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @total_users = User.count
    @admin_users = User.where(admin: true).count
    @regular_users = User.where(admin: false).count
    @recent_users = User.order(created_at: :desc).limit(5)
    
    # Mock data for dashboard stats (replace with real data later)
    @upcoming_tournaments = 3
    @active_clubs = 45
    @news_articles = 12
    @pending_registrations = 8
  end
end
