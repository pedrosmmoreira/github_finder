module GithubFinder
  require 'json'

  class JSONParser
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def self.parse(response)
      new(response)
    end

    def user_events
      JSON.parse response, symbolize_names: true
    end

    def repos
      user_events.inject([]) do |result, event|
        result << event[:repository] if event.has_key?(:repository)
        result
      end
    end

    def languages
      repos.inject(language_count) do |result, repo|
        if repo.has_key?(:language)
          result[repo[:language]] += 1
        end
        result
      end
    end

    def language_count
      Hash.new 0
    end

    def preferred_language
      languages.max_by(&:first)[0]
    end

    private :language_count
  end
end
