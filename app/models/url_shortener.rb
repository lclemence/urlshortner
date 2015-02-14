class UrlShortener < ActiveRecord::Base
  before_create :shortenurl

  belongs_to :user

  private

  def shortenurl
    self.shortened_url =  MurmurHash3::V32.str_hash(self.original_url)
  end
end
