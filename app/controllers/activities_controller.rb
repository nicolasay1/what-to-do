class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all.filter do |activity|
      current_user.saves.where(activity_id: activity.id).empty?
    end
    @activities = @activities.where("date >= ?", Date.new(params[:start_date])) if params[:start_date].present?
    @activities = @activities.where("date <= ?", Date.new(params[:end_date])) if params[:end_date].present?

    if params[:selectedTags].present?
      tags = params[:selectedTags].split(',').map(&:downcase)
      @activities = @activities.filter do |a|
        match = 0
        tags.each do |tag|
          match += 1 if a.tags.split(', ').map(&:downcase).include?(tag)
        end
        match > 0
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
