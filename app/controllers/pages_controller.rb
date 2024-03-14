class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
    @activities = Activity.all
  end


  def update_location
    # Grab Input / POST - Page controller
    location_params = params.permit(:location)
    location = location_params[:location]

    # Geocode to long/lat
    coordinates = Geocoder.search(location).first
    longitude = coordinates.longitude
    latitude = coordinates.latitude


    # Update cookie

    cookies[:user_coordinates] = "#{latitude},#{longitude}"

    # Request.referer

    redirect_to request.referrer, notice: "Location Updated"

  end

  def location_params()
    location_params = params.require.permit(:location)
  end

end
