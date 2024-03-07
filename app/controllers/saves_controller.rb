class SavesController < ApplicationController
  def index
    @saves = Save.where(user: current_user)
  end

  def create
    activity = Activity.find(params[:activity_id])
    Save.create(activity: activity, user: current_user)
    head 201
  end
end
