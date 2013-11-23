class ApplicationController < ActionController::Base
  #before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  # When the resource (Devise) is trying to login we have to redirect them to the page right
  def after_sign_in_path_for(resource)
    if resource.is_a?(Restaurant) 
      panel_path 
    else
      root_path
    end
  end

  protected

    # Load Strong Parameters for devise
    def devise_parameter_sanitizer
      if resource_class == User
        User::ParameterSanitizer.new(User, :user, params)
      else
        super # Use the default one
      end
    end

end
