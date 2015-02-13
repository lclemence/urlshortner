class UrlShortenersController < ApplicationController
  before_action :set_url_shortener, only: [:show, :edit, :update, :destroy]

  # GET /url_shorteners
  # GET /url_shorteners.json
  def index
    @url_shorteners = UrlShortener.all
  end

  # GET /url_shorteners/1
  # GET /url_shorteners/1.json
  def show
  end

  # GET /url_shorteners/new
  def new
    @url_shortener = UrlShortener.new
  end

  # GET /url_shorteners/1/edit
  def edit
  end

  # POST /url_shorteners
  # POST /url_shorteners.json
  def create
    @url_shortener = UrlShortener.new(url_shortener_params)

    respond_to do |format|
      if @url_shortener.save
        format.html { redirect_to @url_shortener, notice: 'Url shortener was successfully created.' }
        format.json { render action: 'show', status: :created, location: @url_shortener }
      else
        format.html { render action: 'new' }
        format.json { render json: @url_shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /url_shorteners/1
  # PATCH/PUT /url_shorteners/1.json
  def update
    respond_to do |format|
      if @url_shortener.update(url_shortener_params)
        format.html { redirect_to @url_shortener, notice: 'Url shortener was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @url_shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_shorteners/1
  # DELETE /url_shorteners/1.json
  def destroy
    @url_shortener.destroy
    respond_to do |format|
      format.html { redirect_to url_shorteners_url }
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
