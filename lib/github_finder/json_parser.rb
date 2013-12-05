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
      repos = []
      user_events.each do |event|
        repos << event[:repository] if event.has_key?(:repository)
      end
      repos
    end

    def languages
      language_count = Hash.new 0
      repos.each do |repo|
        if repo.has_key?(:language)
          language_count[repo[:language]] += 1
        end
      end
      language_count
    end

    def preferred_language
      languages.max_by(&:first)[0]
    end
  end
end
