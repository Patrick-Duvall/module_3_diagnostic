# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search. (531 for sweet potatoes)
# Then I should see a list of ten foods sorted by relevance.
#
# And for each of the foods I should see:
# - The food's NDB Number
# - The food's name
# - The food group to which the food belongs
# - The food's data source
# - The food's manufacturer
require "rails_helper"
WebMock.allow_net_connect!

describe "as a user" do
  it "lets me search a form" do
    visit '/'
    fill_in :q, with: "sweet potatoes"
    click_button "Search"
    save_and_open_page
    expect(current_path).to eq("/foods")
    expect(page).to have_content("531 results")

    expect(page).to have_selector('.food-item', count: 10)

  end

end
