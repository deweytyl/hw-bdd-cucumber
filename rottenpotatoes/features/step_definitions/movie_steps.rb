# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |should_uncheck, rating_list|
  ratings = rating_list.split ", "
  
  ratings.each do |rating|
    if should_uncheck
      uncheck(rating)
    else 
      check(rating)
    end
  end
end

# Solution adapted from:
# http://stackoverflow.com/questions/5490614/capybara-how-do-i-test-that-a-table-has-3-rows-using-capybara
Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  expected_rows = Movie.all.count
  
  page.should have_css('table#movies tbody tr', :count => expected_rows)
end
