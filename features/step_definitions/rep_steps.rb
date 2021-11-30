Then /(.*) representatives should exist in the db/ do | n_seeds |
  expect(Representative.count).to eq n_seeds.to_i
end

Then /^debug$/ do
  # Use this to write "Then debug" in your scenario to open a console.
   require "byebug"; byebug
  1 # intentionally force debugger context in this method
end

Then /the db should not contain dupes/ do
  expect(Representative.where("name == 'Kamala D. Harris'").count).to eq 1
end