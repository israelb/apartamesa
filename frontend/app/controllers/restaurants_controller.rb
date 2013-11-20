class RestaurantsController < ApplicationController
  before_action :authenticate_restaurant!, :only => [:panel]

  def home
  end

  def panel
  end
end
