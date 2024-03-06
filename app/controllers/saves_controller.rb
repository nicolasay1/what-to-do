class SavesController < ApplicationController
  def create
    activity = Activity.find(params[:activity_id])
    Save.create(activity: activity, user: current_user)
    head 201
  end
end
