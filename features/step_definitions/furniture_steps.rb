Then /^I should see the site logo$/ do
  page.should have_css('#masthead h1 img.logo')
end

Then /^the see the site title$/ do
  # within(:css, "#masthead") do
    page.should have_content('The Business Diary')
  # end
end