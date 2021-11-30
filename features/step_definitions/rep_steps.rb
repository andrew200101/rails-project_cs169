# frozen_string_literal: true

Then(/(.*) representatives should exist in the db/) do |n_seeds|
    expect(Representative.count).to eq n_seeds.to_i
end

Then(/the db should not contain dupes/) do
    expect(Representative.where("name == 'Kamala D. Harris'").count).to eq 1
end
