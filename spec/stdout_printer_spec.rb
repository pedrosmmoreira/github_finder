require 'spec_helper'

describe GithubFinder::STDOUTPrinter do
  it 'accepts a username as argument' do
    username = 'example_user'
    message = double('message')
    printer = GithubFinder::STDOUTPrinter.new username, message

    expect(printer.username).to eq username
  end

  it 'accepts a message as argument' do
    username = 'example_user'
    message = double('message')
    printer = GithubFinder::STDOUTPrinter.new username, message

    expect(printer.message).to eq message
  end
end

describe GithubFinder::STDOUTPrinter, '.print_message' do
  it 'prints the a formatted message to STDOUT' do
    username = 'example_user'
    message = 'Ruby'
    formatted_message = "#{username} prefers #{message}!"
    printed_message = GithubFinder::STDOUTPrinter.print_message username, message

    expect(printed_message).to eq formatted_message
  end
end
