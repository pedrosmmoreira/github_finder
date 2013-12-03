require 'open-uri'

class HTTPSearcher

  def initialize(username)
    @username = username
  end

  def self.find_by(username)
    new(username).fetch
  end

  def fetch
    open(user_uri).read
  end

  private

  attr_reader :username

  def user_uri
    "https://github.com/#{username}.json"
  end
end
