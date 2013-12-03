class GithubFinder
  attr_reader :data_parser, :searcher, :username

  def initialize(username, options = {})
    @username = username
    @searcher = options.fetch(:searcher) { HTTPSearcher }
    @data_parser = options.fetch(:data_parser) { JSONParser }
  end
end
