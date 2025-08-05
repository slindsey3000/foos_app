class HomeController < ApplicationController
  def index
    @random_number = rand(1..1000)
  end
end
