Apartamesa::Application.routes.draw do
  root :to => "home#index"

  devise_for  :users, 
              :path => '',
              :path_names => {  :sign_in  => "login", 
                                :sign_out => "logout", 
                                :sign_up  => "register" }


end
