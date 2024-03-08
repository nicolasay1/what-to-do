class AttendancesController < ApplicationController

  def create
    if Attendance.create(event_id: params[:event_id], user_id: current_user.id, attendance: params[:attendance])
      flash[:notice] = "activity sent successfully."
      head 201

    else
      head 500
    end
  end

end
