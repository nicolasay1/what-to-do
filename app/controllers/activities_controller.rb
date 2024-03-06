class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    @random_activity = Activity.order("RANDOM()").first
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def share
    @activity = Activity.find(params[:id])
    @groups = Group.where(user: current_user)
  end
end
