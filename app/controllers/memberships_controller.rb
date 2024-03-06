class MembershipsController < ApplicationController
  before_action :set_user_to_add, :set_group


  def new
    @user = Membership.new
    if params[:query].present?
      users = User.all
    end
  end

  def create

    @new_member = Membership.new(membership_params)
    if @new_member.save
      redirect_to group_path(@group)
      flash[:notice] = "Member added successfully"
    else
      flash[:notice] = "There was an issue"
    end
  end

  def destroy
  end

  private

  def set_user_to_add
    users = User.all
    @user_to_add = users.find_by(email: params[:query])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def membership_params
    params.require(:membership).permit(:group_id, :user_id)
  end

end
