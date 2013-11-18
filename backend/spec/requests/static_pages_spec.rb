require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'Panel de control'" do
      visit root_url
      expect(page).to have_content('Panel de control')
    end
  end


  describe "Help page" do
    it "should have the content 'Help'" do
      pending("I have to do the page 'help'")
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end

end