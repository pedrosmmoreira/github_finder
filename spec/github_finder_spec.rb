require_relative '../lib/github_finder'
require_relative '../lib/http_searcher'
require_relative '../lib/json_parser'

describe GithubFinder do
  it 'accepts a username as argument' do
    username = 'example_user'
    finder = GithubFinder.new username

    expect(finder.username).to eq username
  end

  it 'accepts a searcher as an option' do
    username = 'example_user'
    searcher = double('searcher')
    finder = GithubFinder.new username, searcher: searcher

    expect(finder.searcher).to eq searcher
  end

  it 'defaults to HTTPSearcher if no searcher is passed in' do
    username = 'example_user'
    finder = GithubFinder.new username

    expect(finder.searcher).to be HTTPSearcher
  end

  it 'accepts a data parser as an option' do
    username = 'example_user'
    data_parser = double('data_parser')
    finder = GithubFinder.new username, data_parser: data_parser

    expect(finder.data_parser).to eq data_parser
  end

  it 'defaults to JSONParser if no data parse is passed in' do
    username = 'example_user'
    finder = GithubFinder.new username

    expect(finder.data_parser).to be JSONParser
  end
end
