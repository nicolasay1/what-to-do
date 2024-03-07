class EventsController < ApplicationController

  def index
    @events = Event.where(group_id: params[:group_id])
  end

  def create
    if Event.create(group_id: params[:group_id], activity_id: params[:activity_id])
      head 201
    else
      head 500
    end
  end

end
