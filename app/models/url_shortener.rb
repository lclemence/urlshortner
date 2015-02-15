IPv4_PART = /\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]/  # 0-255
  REGEXP = %r{
    \A
    https?://                                                    # http:// or https://
    ([^\s:@]+:[^\s:@]*@)?                                        # optional username:pw@
    ( (([^\W_]+\.)*xn--)?[^\W_]+([-.][^\W_]+)*\.[a-z]{2,6}\.? |  # domain (including Punycode/IDN)...
        #{IPv4_PART}(\.#{IPv4_PART}){3} )                        # or IPv4
    (:\d{1,5})?                                                  # optional port
    ([/?]\S*)?                                                   # optional /whatever or ?whatever
    \Z
  }iux

class UrlShortener
  include Mongoid::Document
  before_create :shortenurl

  belongs_to :user

  field :original_url,   :type => String
  field :shortened_url,   :type => String
  field :used,   :type => Integer, default: 0

  validates :original_url, allow_nil: false, uniqueness: true, format: { with: REGEXP, allow_blank: false}

  def redirection
    self.log
    self.save
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
