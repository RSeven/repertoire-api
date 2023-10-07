class SetlistsController < ApplicationController
  before_action :set_setlist, only: %i[ show update destroy ]

  # GET /setlists
  def index
    @setlists = Setlist.all

    render json: @setlists.includes(:music_setlists, :musics).to_json(include: [:music_setlists, :musics])
  end

  # GET /setlists/1
  def show
    render json: @setlists.includes(:music_setlists, :musics)
  end

  # POST /setlists
  def create
    @setlist = Setlist.new(setlist_params)

    if @setlist.save
      render json: @setlist, status: :created, location: @setlist
    else
      render json: @setlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /setlists/1
  def update
    if @setlist.update(setlist_params)
      render json: @setlist
    else
      render json: @setlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /setlists/1
  def destroy
    @setlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setlist
      @setlist = Setlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def setlist_params
      params.require(:setlist).permit(:name, :date, music_setlists_attributes: [:id, :music_id, :setlist_id, :position, :_destroy])
    end
end
