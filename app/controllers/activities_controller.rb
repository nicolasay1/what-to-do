class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all.filter do |activity|
      current_user.saves.where(activity_id: activity.id).empty?
    end
    @activities = Activity.near(cookies[:user_coordinates], params[:distance]) if params[:distance].present?
    @activities = @activities.filter { |activity| activity.date >= Date.parse(params[:startDate]) } if params[:startDate].present?
    @activities = @activities.filter { |activity| activity.date <= Date.parse(params[:endDate]) } if params[:endDate].present?

    if params[:selectedTags].present?
      tags = params[:selectedTags].split(',').map(&:downcase)
      @activities = @activities.filter do |a|
        match = 0
        tags.each do |tag|
          match += 1 if a.tags.split(', ').map(&:downcase).include?(tag)
        end
        match > 0 # matching
      end
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @markers = [{ latitude: @activity.latitude, longitude: @activity.longitude }]
  end

  def share
    @activity = Activity.find(params[:id])
    @groups = Group.where(user: current_user)
  end
end
