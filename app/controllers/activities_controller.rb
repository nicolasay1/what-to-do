class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all.filter do |activity|
      current_user.saves.where(activity_id: activity.id).empty?
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @markers = [{lat: @activity.lat, lng: @activity.lng}]
  end

  def share
    @activity = Activity.find(params[:id])
    @groups = Group.where(user: current_user)
  end
end
