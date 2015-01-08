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

Given(/^There is the "(.*?)" folder created$/) do |arg1|
  Folder.destroy_all
  Folder.create(path: '/etc')
end

When(/^I click in remove button$/) do
  within('#folders') do
    all(:css, 'button.delete').first.click
  end
end

Then(/^folder "(.*?)" should be removed$/) do |arg1|
  within('#folders') do
    expect(page).to have_no_content arg1
  end
end
