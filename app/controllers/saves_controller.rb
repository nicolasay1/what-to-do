class SavesController < ApplicationController
  def index
    @saves = Save.where(user: current_user)
  end

  def create
    activity = Activity.find(params[:activity_id])
    Save.create(activity: activity, user: current_user)
    head 201
  end


  def destroy
    save = Save.find_by(id: params[:id], user: current_user)
    if save
      save.destroy
      redirect_to saves_path
    else
      head :not_found
    end
  end

end
