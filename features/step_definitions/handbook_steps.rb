Given /^the following handbooks:$/ do |handbooks|
  Handbook.create!(handbooks.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) handbook$/ do |pos|
  visit handbooks_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following handbooks:$/ do |expected_handbooks_table|
  expected_handbooks_table.diff!(tableish('table tr', 'td,th'))
end
