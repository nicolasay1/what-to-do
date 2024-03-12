class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
    @activities = Activity.all
  end


  def update_location
    # EC1V input / autocomplete

    # Grab Inpput / POST - Page controller
    location_params = params.permit(:location)
    location = location_params[:location]

    # Geocode to long/lat
    coordinates = Geocoder.search(location).first
    lat = coordinates.latitude
    lng = coordinates.longitude


    # Update cookie
    puts "***********************************************************"
    puts "***********************************************************"
    puts cookies[:user_lat]
    cookies[:user_lat] = "#{lat},#{lng}"
    puts cookies[:user_lat]
    puts "***********************************************************"
    puts "***********************************************************"

    # Request.referer

    redirect_to request.referrer, notice: "Location Updated"

  end

  def location_params()
    location_params = params.require.permit(:location)
  end

end
