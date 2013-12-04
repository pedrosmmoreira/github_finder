require 'spec_helper'

describe GithubFinder::HTTPSearcher, '.find_by' do
  it 'searches a username on Github' do
    username = 'example_user'
    user_info = double('user_info')
    OpenURI.stub_chain(:open_uri, :read).and_return(user_info)

    searcher = GithubFinder::HTTPSearcher.find_by username

    expect(searcher).to eq user_info
  end
end
