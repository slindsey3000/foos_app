class BoardController < ApplicationController
  def index
    @directors = User.directors.order(:lastname, :firstname)
  end
end
