class HomeController < ApplicationController

  def index
    url = UrlShortener.find_by(shortened_url: params[:id])
    redirect_to url.redirection
  end
end
