require_relative '../lib/stdout_printer'

describe STDOUTPrinter do
  it 'accepts a username as argument' do
    username = 'example_user'
    message = double('message')
    printer = STDOUTPrinter.new username, message

    expect(printer.username).to eq username
  end

  it 'accepts a message as argument' do
    username = 'example_user'
    message = double('message')
    printer = STDOUTPrinter.new username, message

    expect(printer.message).to eq message
  end
end

describe STDOUTPrinter, '#print_message' do
  it 'prints the a formatted message to STDOUT' do
    username = 'example_user'
    message = 'Ruby'
    formatted_message = "#{username} prefers #{message}!"
    expect(STDOUT).to receive(:puts).with(formatted_message)

    printer = STDOUTPrinter.new(username, message).print_message
  end
end
