Given(/^I'm at dashboard page$/) do
  visit('/')
end

When(/^I fill input "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^I click in add button$/) do
  click_button 'add'
end

Then(/^new folder "(.*?)" should be created$/) do |arg1|
  within('#folders') do
    expect(page).to have_content arg1
  end
end
