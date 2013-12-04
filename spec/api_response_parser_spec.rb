require_relative '../lib/api_response_parser'

describe APIResponseParser do
  it 'accepts a response as argument' do
    response = double('response')
    parser = APIResponseParser.new response

    expect(parser.response).to eq response
  end
end

describe APIResponseParser, '.parse' do
  it 'returns an instance of APIResponseParser' do
    response = double('response')
    parser = APIResponseParser.parse(response)

    expect(parser).to be_an APIResponseParser
  end
end

describe APIResponseParser, '#languages' do
  it 'parses language info from the response' do
    response = []
    parser = APIResponseParser.parse(response)
    languages = parser.languages

    expect(languages).not_to be_empty
  end
end
