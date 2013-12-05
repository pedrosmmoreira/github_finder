require 'spec_helper'

describe GithubFinder::JSONParser do
  it 'accepts a JSON response as argument' do
    response = double('response')
    parser = GithubFinder::JSONParser.new response

    expect(parser.response).to eq response
  end
end

describe GithubFinder::JSONParser, '#user_events' do
  it 'parses the given response' do
    response = File.open('spec/fixtures/dhh.json').read
    data = GithubFinder::JSONParser.new(response).user_events

    expect(data.length).to eq 30
  end
end

describe GithubFinder::JSONParser, '#repos' do
  it 'returns the repos from the response' do
    response = File.open('spec/fixtures/dhh.json').read
    parser = GithubFinder::JSONParser.new response

    expect(parser.repos.length).to eq 30
  end
end

describe GithubFinder::JSONParser, '#languages' do
  it 'returns a hash with the language count for each repo' do
    response = File.open('spec/fixtures/dhh.json').read
    parser = GithubFinder::JSONParser.new response

    expect(parser.languages).to eq({ 'Ruby' => 29, 'CoffeeScript' => 1 } )
  end

  it 'ignores repos with no language information' do
    response = double('response')
    parser = GithubFinder::JSONParser.new response
    JSON.stub(:parse).with(response, symbolize_names: true).and_return(
      [
        { repository: { language: 'Ruby'}},
        { repository: { language: 'Ruby'}},
        { repository: {}}
      ]
    )

    expect(parser.languages).to eq({ 'Ruby' => 2 })
  end
end

describe GithubFinder::JSONParser, '#preferred_language' do
  context 'when a language is more used' do
    it 'returns most used language in all the repos' do
      response = File.open('spec/fixtures/dhh.json').read
      parser = GithubFinder::JSONParser.new response

      expect(parser.preferred_language).to eq 'Ruby'
    end
  end
  context 'when languages occur with same frequency' do
    it 'returns the language that appears more recently in the user info' do
      response = double('response')
      parser = GithubFinder::JSONParser.new response
      JSON.stub(:parse).with(response, symbolize_names: true).and_return(
        [
          { repository: { language: 'Ruby'} },
          { repository: { language: 'Objective-C'} },
          { repository: { language: 'Objective-C'} },
          { repository: { language: 'Objective-C'} },
          { repository: { language: 'Ruby'} },
          { repository: { language: 'Ruby'} },
          { repository: { language: 'Javascript'} }
        ]
      )

      expect(parser.preferred_language).to eq 'Ruby'
    end
  end
end
