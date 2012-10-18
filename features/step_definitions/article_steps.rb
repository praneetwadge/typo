Given /the following blogs exist/ do |blogs_table|
  blogs_table.hashes.each do |blog|
    Article.create!(blog)
  end
end

And /^I am logged into the admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => ''
  click_button 'Login'
  Then I should see 'Login successful'
end

Given /^I am logged into the admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => ''
  click_button 'Login'
  Then I should see 'Login successful'

end

And /^I am on the admin content page$/ do
  visit '/admin/content'
end  
