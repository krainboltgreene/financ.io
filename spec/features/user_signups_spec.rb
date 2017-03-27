require "rails_helper"

RSpec.feature "UserSignups", type: :feature do
  scenario "Signing up for a new account" do
    "Given I'm on the signup page"
    "And I'm not logged in"
    "When I click sign up"
    "And I fill in my organization details"
    "And I fill in my user information"
    "Then I should be signed in"
    "And be on the organization subdomain"
  end
end
