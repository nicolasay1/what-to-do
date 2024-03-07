class EventsController < ApplicationController

  def index
    @events = Event.where(group_id: params[:group_id])
  end

  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.where(event_id: @event.id, user_id: current_user.id).first
    @attending = Attendance.where(event_id: @event.id, attendance: true)
    @notAttending = Attendance.where(event_id: @event.id, attendance: false)
  end

  def new
    @event = Event.new
    @activity = Activity.find(params[:activity_id])
    @groups = Group.where(user: current_user)
  end

  def create
    @event = Event.new(event_params)
    if @event.save!
      redirect_to group_path(@event.group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:activity_id, :group_id, :date, :time)
  end

end
