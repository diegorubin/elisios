Given(/^only Rails\.root folder created$/) do
  Folder.destroy_all
  Folder.create(path: Rails.root.to_s)
end

When(/^I click in Rails\.root folder$/) do
  find('p.openFolder', text: Rails.root.to_s).click
end

When(/^I click in Gemfile.lock file$/) do
  find('a.openFile', text: 'Gemfile.lock').click
end

Then(/^get Gemfile.lock$/) do
  expect(page.response_headers['Content-Disposition']).to match(/Gemfile.lock/)
end
