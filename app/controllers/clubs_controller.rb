class ClubsController < ApplicationController
  include StateHelper
  
  before_action :set_club, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ new create edit update destroy ]

  # GET /clubs or /clubs.json
  def index
    @clubs = search_clubs
    @search_query = params[:state]
    @search_message = @search_message
    @current_page = params[:page].to_i > 0 ? params[:page].to_i : 1
  end
  
  # GET /clubs/search
  def search
    @clubs = search_clubs
    @search_query = params[:state]
    render json: {
      clubs: @clubs.map { |club| { id: club.id, name: club.name, address: club.full_address, url: club_path(club) } },
      message: @search_message,
      total: @clubs.count
    }
  end

  # GET /clubs/1 or /clubs/1.json
  def show
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs or /clubs.json
  def create
    @club = Club.new(club_params)

    if @club.save
      redirect_to @club, notice: "Club was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clubs/1 or /clubs/1.json
  def update
    if @club.update(club_params)
      redirect_to @club, notice: "Club was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /clubs/1 or /clubs/1.json
  def destroy
    @club.destroy
    redirect_to clubs_path, notice: "Club was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def club_params
      params.require(:club).permit(:name, :address, :city, :state, :zip_code, :phone, :email, :website, :coordinates, :day_and_time_info, :description, :image_url, :contact_person, :established_date)
    end
    
    def search_clubs
      page = params[:page].to_i
      page = 1 if page < 1
      per_page = action_name == 'index' ? 15 : 6
      offset = (page - 1) * per_page
      
      if params[:state].blank?
        @search_message = nil
        @has_more = Club.count > offset + per_page
        return Club.recent.offset(offset).limit(per_page)
      end
      
      # Normalize the state input
      state_abbr = StateHelper.normalize_state_input(params[:state])
      
      if state_abbr.nil?
        @search_message = "No exact match found for '#{params[:state]}'. Showing clubs from all states."
        @has_more = Club.count > offset + per_page
        return Club.recent.offset(offset).limit(per_page)
      end
      
      # Get clubs ordered by: target state, nearby states, then all others
      target_state_clubs = Club.where(state: [state_abbr, state_abbr.downcase]).recent
      nearby_states = StateHelper.get_nearby_states(state_abbr, 5)
      nearby_clubs = Club.where(state: nearby_states + nearby_states.map(&:downcase)).recent
      other_clubs = Club.where.not(state: [state_abbr, state_abbr.downcase] + nearby_states + nearby_states.map(&:downcase)).recent
      
      # Combine results in order
      all_results = []
      all_results += target_state_clubs.to_a
      all_results += nearby_clubs.to_a
      all_results += other_clubs.to_a
      
      # Paginate the combined results
      paginated_results = all_results[offset, per_page] || []
      @has_more = all_results.length > offset + per_page
      
      # Set appropriate message
      if target_state_clubs.any?
        nearby_count = nearby_clubs.count
        other_count = paginated_results.count - target_state_clubs.count - nearby_clubs.count
        other_count = [other_count, 0].max
        
        if nearby_count > 0 || other_count > 0
          parts = []
          parts << "#{target_state_clubs.count} from #{state_abbr}"
          parts << "#{nearby_count} from nearby states" if nearby_count > 0
          parts << "#{other_count} from other states" if other_count > 0
          @search_message = "Found #{parts.join(', ')}."
        else
          @search_message = nil
        end
      elsif nearby_clubs.any?
        state_names = nearby_states.first(3).map { |abbr| StateHelper::STATES.key(abbr) || abbr }.join(", ")
        @search_message = "No clubs found in #{state_abbr}. Showing clubs from nearby states: #{state_names}#{nearby_states.length > 3 ? ' and others' : ''}."
      else
        @search_message = "No clubs found in #{state_abbr} or nearby states. Showing all clubs."
      end
      
      paginated_results
    end
end
