class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    # @activities = Activity.all.where("date >= ?", params[:start_date]) if params[:start_date].present?
    # @activities = @activities.where("date <= ?", params[:end_date]) if params[:end_date].present?
    # @activities = @activities.filter do |activity|
    #   current_user.saves.where(activity_id: activity.id).empty?
    # end

    # if params[:tags].present?
    #   tags = params[:tags].split(', ')
    #   @activities = @activities.joins(:tags).where(tags: { name: tags }).group('activities.id').having('COUNT(tags.id) > 0')
    # end
  end

  def show
    @activity = Activity.find(params[:id])
    @markers = [{ lat: @activity.lat, lng: @activity.lng }]
  end

  def share
    @activity = Activity.find(params[:id])
    @groups = Group.where(user: current_user)
  end
end
