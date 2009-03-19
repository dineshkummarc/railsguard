Given /^the following ships:$/ do |ships|
  Ships.create!(ships.hashes)
end   

Given /^that I have created a ship "(.*)"$/ do |title|
  Ship.create!(:title => title )
end        

When /^I go to the ships page$/ do 
  visit "/ships"
end

# When /^I delete the (\d+)(?:st|nd|rd|th) ships$/ do |pos|
#   visit ships_url
#   within("table > tr:nth-child(#{pos.to_i+1})") do
#     click_link "Destroy"
#   end
# end

Then /^I should see the following ships:$/ do |ships|
  ships.raw[1..-1].each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end
