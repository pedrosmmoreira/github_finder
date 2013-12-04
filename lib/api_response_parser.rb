class APIResponseParser
  attr_reader :response

  def initialize(response)
    @response = response
  end

  def self.parse(response)
    new(response)
  end

  def languages
    response.map { |repo| repo.language }
    remove_empty_entries
  end

  def language_count
    language_count = Hash.new 0
    languages.each do |language|
      language_count[language] += 1
    end
    language_count
  end

  def preferred_language
    language_count.max_by(&:first)[0]
  end

  def remove_empty_entries
    languages.reject! { |language| language.blank? }
  end
end
