class ClubsController < ApplicationController
  before_action :set_club, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ new create edit update destroy ]

  # GET /clubs or /clubs.json
  def index
    @clubs = Club.recent
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
end
