class UrlShortenersController < ApplicationController
  before_action :set_url_shortener, only: [:destroy]

  # GET /url_shorteners
  # GET /url_shorteners.json
  def index
    @url_shortener = UrlShortener.new
    if user_signed_in?
      @user = User.find(current_user.id)
      @url_shorteners = @user.url_shorteners
    else
      @url_shorteners = nil
    end
  end

  # GET /url_shorteners/new
  def new
    @url_shortener = UrlShortener.new
  end

  # POST /url_shorteners
  # POST /url_shorteners.json
  def create
    @url_shortener = UrlShortener.new(url_shortener_params)

    respond_to do |format|
      if @url_shortener.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render json: @url_shortener, status: :created, location: @url_shortener }
      else
        format.html { render action: "index" }
        format.json { render json: @url_shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_shorteners/1
  # DELETE /url_shorteners/1.json
  def destroy
    @url_shortener.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_shortener
      @url_shortener = UrlShortener.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_shortener_params
      params.require(:url_shortener).permit(:user_id, :original_url, :shortened_url)
    end
end
