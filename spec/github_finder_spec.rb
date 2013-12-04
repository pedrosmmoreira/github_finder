require 'spec_helper'

describe GithubFinder::GithubFinder, 'configuration' do
  it 'accepts a username as argument' do
    username = 'example_user'
    finder = GithubFinder::GithubFinder.new username

    expect(finder.username).to eq username
  end

  it 'accepts a searcher as an option' do
    username = 'example_user'
    searcher = double('searcher')
    finder = GithubFinder::GithubFinder.new username, searcher: searcher

    expect(finder.searcher).to eq searcher
  end

  it 'defaults to HTTPSearcher if no searcher is passed in' do
    username = 'example_user'
    finder = GithubFinder::GithubFinder.new username

    expect(finder.searcher).to be GithubFinder::HTTPSearcher
  end

  it 'accepts a data parser as an option' do
    username = 'example_user'
    data_parser = double('data_parser')
    finder = GithubFinder::GithubFinder.new username, data_parser: data_parser

    expect(finder.data_parser).to eq data_parser
  end

  it 'defaults to JSONParser if no data parse is passed in' do
    username = 'example_user'
    finder = GithubFinder::GithubFinder.new username

    expect(finder.data_parser).to be GithubFinder::JSONParser
  end

  it 'accepts a result printer as an option' do
    username = 'example_user'
    result_printer = double('result_printer')
    finder = GithubFinder::GithubFinder.new username, result_printer: result_printer

    expect(finder.result_printer).to eq result_printer
  end

  it 'defaults to STDOUTPrinter if no result_printer is passed in' do
    username = 'example_user'
    finder = GithubFinder::GithubFinder.new username

    expect(finder.result_printer).to be GithubFinder::STDOUTPrinter
  end
end
