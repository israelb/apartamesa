class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  # When the resource is traing to login we have to redirect him to the page right
  def after_sign_in_path_for(resource)
    if resource.is_a?(Restaurant) 
      panel_path 
    else
      root_path
    end
  end
end
