class HomeController < ApplicationController

  def index
    url = UrlShortener.find_by(shortened_url: params[:id])
    redirect_to url.original_url
  end
end
