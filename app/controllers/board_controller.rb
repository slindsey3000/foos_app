class BoardController < ApplicationController
  def index
    # Sort directors by priority: President first, Vice President second, then by title, then alphabetically
    @directors = User.directors.sort_by do |director|
      title = director.director_title&.downcase || ''
      priority = case title
                 when 'president'
                   1
                 when 'vice president'
                   2
                 else
                   title.present? ? 3 : 4
                 end
      [priority, director.lastname.downcase, director.firstname.downcase]
    end
    
    @committee_members = User.where(world_cup_selection_committee: true).order(:lastname, :firstname)
  end
end
