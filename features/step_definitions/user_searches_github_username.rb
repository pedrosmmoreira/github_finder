require_relative '../../lib/github_finder'

Given(/^I am interested in programming$/) do
end

When(/^I search for a Github username$/) do
  username = 'tenderlove'
  @finder = GithubFinder::GithubFinder.new(username)
end

Then(/^I should see the preferred programming language for that user$/) do
  expect(@finder.find_preferred_language).to eq 'tenderlove prefers Ruby!'
end
