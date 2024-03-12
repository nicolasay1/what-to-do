class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :show_location

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
  end

  def show_location
    location_cookie = cookies[:user_lat]
    if location_cookie
      @location_cookie = Geocoder.search(location_cookie).first.postal_code
    end
  end

end
