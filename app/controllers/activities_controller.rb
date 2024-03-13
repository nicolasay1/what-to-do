class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all.filter do |activity|
      current_user.saves.where(activity_id: activity.id).empty?
    end
    @activities = @activities.filter { |a| a.date >= Date.parse(params[:startDate]) } if params[:startDate].present?
    @activities = @activities.filter { |a| a.date <= Date.parse(params[:endDate]) } if params[:endDate].present?

    if params[:selectedTags].present?
      tags = params[:selectedTags].split(',').map(&:downcase)
      @activities = @activities.filter do |a|
        match = 0
        tags.each do |tag|
          match += 1 if a.tags.split(', ').map(&:downcase).include?(tag) # matching
        end
        match > 0 # matching
      end
    end
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
