Given /^I am not on the homepage$/ do
  visit 'about/index'
end

Given /^I click the site logo$/ do
 click_link('go-home')
end