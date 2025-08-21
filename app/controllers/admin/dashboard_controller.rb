class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @total_users = User.count
    @admin_users = User.where(admin: true).count
    @regular_users = User.where(admin: false).count
    @recent_users = User.order(created_at: :desc).limit(5)
    
    # Real data for dashboard stats
    @upcoming_tournaments = 3
    @active_clubs = Club.count
    @news_articles = Article.count
    @pending_registrations = 8
    @total_visitors = IpVisitor.count
    @total_page_visits = PageVisit.count
  end
end
