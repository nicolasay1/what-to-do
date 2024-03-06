class MembershipsController < ApplicationController

  def new
    @users = User.all
    if params[:query].present?
      @user_to_add = @users.find_by(email: params[:query])
    end
  end

  def destroy
  end

end
