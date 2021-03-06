Given /^the following needs$/ do |table|
    # table is a Cucumber::Ast::Table
    table.hashes.each do |hash|
        need = Need.create(:description => hash[:description])
    end
end

Then /^I should see all the needs$/ do
    page.should have_selector('ul#needs')
end

Then /^I should see a "([^"]*)" need on the list$/ do |arg1|
    page.should have_content(arg1)
end

Then /^I should be able to see all the needs on the map$/ do
    needs = Need.all
    needs.each do | need |
    
       function = "
       (function() { 
            var didit = false;  
            $.each(marker, function(k, m) { 
                if(m.title == '#{need.description}') { 
                    didit = true; 
                } 
            }); 
            return didit; 
        })();" 
        page.evaluate_script(function).should == true
    end
end

