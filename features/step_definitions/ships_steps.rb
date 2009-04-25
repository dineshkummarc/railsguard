Given /^the following ships:$/ do |ships|
  ships.each do |ship|
    Ship.make(:name => ship)
  end
end   

Given /^that I have created a ship "(.*)"$/ do |name|
  Ship.make(:name => name )
end    
 
Given /^I edit a ship "(.*)"$/ do
  Ship.make(:id => 2, :name => name )
end
  

When /^I go to the ships page$/ do 
  visit "/ships"
end   

Then /^the name should be "(.*)"$/ do |name|    
  response.should have_tag("h2", :text => name)
end   

Then /^the description should be "(.*)"$/ do |desc|    
  response.should have_tag("textarea", :text => desc)
end

Then /^the tonnage should be "(.*)"$/ do |name|    
  response.should have_selector("tr.tonnage td:nth-child(2)") do |td|
    td.inner_html.should == "#{name} Tons"
  end
end

Then /^the "([^\"]*)" should be "(.*)"$/ do |attr, value|    
  response.should have_tag("input", :value => value)
end  

Then /^the "([^\"]*)" select should be "(.*)"$/ do |attr, value|    
  response.should have_tag("option", :text => value)
end

Then /^I should see the following ships:$/ do |ships|
  ships.raw[1..-1].each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end


