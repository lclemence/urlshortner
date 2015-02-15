class UrlShortener
  include Mongoid::Document
  before_create :shortenurl

  belongs_to :user

  field :original_url,   :type => String
  field :shortened_url,   :type => String
  field :used,   :type => Integer, default: 0

  validates :original_url, :url => true

  def redirection
    self.log
    self.save!
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
