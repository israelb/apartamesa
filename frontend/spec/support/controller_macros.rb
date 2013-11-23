module ControllerMacros
  def login_restaurant
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:restaurants]
      restaurant = FactoryGirl.create(:restaurant) # Using factory girl as an example
      sign_in restaurant
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
    end
  end
end