class HomeController < ApplicationController
  def index
    # Get real articles from the database
    @news_articles = Article.published.featured.recent.limit(3)

    # Get real clubs from the database
    @locations = Club.recent.limit(6)
  end
end
