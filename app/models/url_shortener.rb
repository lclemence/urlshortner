class UrlShortener < ActiveRecord::Base
  before_create :shortenurl

  belongs_to :user

  def redirection
    self.log
    self.original_url
  end

  def log
    self.used=self.used+1
  end

  private

  def shortenurl
    self.shortened_url =  MurmurHash3::V32.str_hash(self.original_url)
  end
end
