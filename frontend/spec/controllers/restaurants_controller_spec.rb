require 'spec_helper'

describe RestaurantsController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'panel'" do
    it "returns http success" do
      get 'panel'
      response.should be_success
    end
  end

end
