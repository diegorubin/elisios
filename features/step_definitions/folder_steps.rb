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
  Folder.create(path: arg1)
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

Then(/^clear the input "(.*?)"$/) do |arg1|
  expect(find("##{arg1}").value).to be_blank
end

Given(/^No folders$/) do
  Folder.destroy_all
end

Then(/^not create a new folder$/) do
  expect(all("#folders .folderContainer").size).to eql(0)
end

Then(/^show message "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^only "(.*?)" folder created$/) do |arg1|
  Folder.destroy_all
  Folder.create(path: arg1)
end

When(/^I click in "(.*?)" folder$/) do |arg1|
  all('p.openFolder', text: arg1).first.click
end

Then(/^files should be listed$/) do
  expect(find("#files")).to have_content('/..')
end

Then(/^folder "(.*?)" should not shown$/) do |arg1|
  expect(find("#files")).to have_content('/..')
  expect(all('p.openFolder', text: /^#{arg1}$/).size).to eql(0)
end

Given(/^an list of folders$/) do |table|
  Folder.destroy_all
  table.hashes.each { |row| Folder.create(path: row[:path]) }
end

When(/^I filter for "(.*?)"$/) do |folder_name|
  fill_in 'filter', with: folder_name
end

When(/^I click on "(.*?)"$/) do |button_name|
  click_button button_name
end

Then(/^folder "(.*?)" should not be shown$/) do |folder_name|
  within('#folders') do
    expect(page).to have_no_content folder_name
  end
end

Then(/^only "(.*?)" should be shown$/) do |folder_name|
  expect(find('.folderContainer')).to have_content folder_name
end

Then(/^should shown "(.*?)" folders$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

