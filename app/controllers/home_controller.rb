class HomeController < ApplicationController
  include StateHelper
  
  def index
    # Get real articles from the database
    @news_articles = Article.published.featured.recent.limit(3)

    # Get real clubs from the database - with search support
    if params[:state].present?
      redirect_to clubs_path(state: params[:state])
    else
      @locations = Club.recent.limit(6)
    end
  end
end
