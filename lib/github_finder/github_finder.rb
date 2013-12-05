module GithubFinder
  class GithubFinder
    attr_reader :data_parser, :result_printer, :searcher, :username

    def initialize(username, options = {})
      @username = username
      @searcher = options.fetch(:searcher) { HTTPSearcher }
      @data_parser = options.fetch(:data_parser) { JSONParser }
      @result_printer = options.fetch(:result_printer) { STDOUTPrinter }
    end

    def find_preferred_language
      print_preferred_language
    end

    private

    def search_and_parse_data
      search_data
      parse_data
    end

    def search_data
      searcher.find_by username
    end

    def parse_data
      data_parser.parse search_data
    end

    def preferred_language
      parse_data.preferred_language
    end

    def print_preferred_language
      result_printer.print_message username, preferred_language
    end
  end
end
