require 'rails_helper'

RSpec.describe UrlShortener, type: :model do
  before(:each) do
    generated_password = Devise.friendly_token.first(8)
    @user = User.create!(:email => 'test@gmail.com', :password => generated_password)
    @url = UrlShortener.create!(user_id: @user.id, original_url: "http://google.fr")
  end

  it "return the url to redirect" do
    expect(@url.redirection).to eq("http://google.fr")
  end

  it "should log the click" do
    @url.redirection
    expect(@url.used).to eq(1)
  end

  it "should shorten the original url" do
    expect(@url.shortened_url).not_to eq('')
  end
end
