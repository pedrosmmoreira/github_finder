module GithubFinder
  class STDOUTPrinter
    attr_reader :message, :username

    def initialize(username, message)
      @message = message
      @username = username
    end

    def self.print_message(username, message)
      new(username, message).print_formatted_message
    end

    def print_formatted_message
      formatted_message
    end

    private

    def formatted_message
      "#{username} prefers #{message}!"
    end
  end
end
