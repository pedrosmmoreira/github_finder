require 'octokit'

class APISearcher
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def self.find_by(username)
    new(username).fetch
  end

  def fetch
    get_user_repositories
  end

  private

  def client
    Octokit
  end

  def get_user_repositories
    client.repositories username
  end
end
