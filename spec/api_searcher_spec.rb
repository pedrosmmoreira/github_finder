require_relative '../lib/api_searcher'

describe APISearcher do
  it 'accepts a username as argument' do
    username = 'example_user'
    searcher = APISearcher.new username

    expect(searcher.username).to eq username
  end
end

describe APISearcher, '.find_by' do
  it 'returns an instance of APISearcher' do
    username = 'example_user'
    searcher = APISearcher.find_by username

    expect(searcher).to be_an APISearcher
  end
end

describe APISearcher, '#fetch' do
  it 'returns the public repos for a user' do
    username = 'pedrosmmoreira'
    Octokit.stub(:repositories).with(username).and_return([
      { owner: { login: "#{username}"} }
    ])
    response = APISearcher.new(username).fetch

    expect(response.first[:owner][:login]).to eq username
  end
end
