Given(/^I am interested in programming$/) do
end

When(/^I search for a Github username$/) do
  @username = 'dhh'
  @searcher = double('searcher')
  @finder = GithubFinder::GithubFinder.new(@username, searcher: @searcher)
end

Then(/^I should see the preferred programming language for that user$/) do
  user_info = File.open('spec/fixtures/dhh.json').read
  @searcher.stub(:find_by).with(@username).and_return(user_info)
  expect(@finder.find_preferred_language).to eq "#{@username} prefers Ruby!"
end
