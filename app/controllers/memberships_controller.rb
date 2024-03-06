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
    @member = Membership.find_by(membership_params)
    if current_user == @member.user
      if @member.destroy
      redirect_to groups_path
      flash[:notice] = "You've been removed from the group"
      end
    elsif @member.destroy
      redirect_to group_path(@group)
      flash[:notice] = "Member removed successfully"
    else
      render :destroy, status: :unprocessable_entity
    end
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
    params.require(:membership).permit(:group, :group_id, :user_id, :admin)
  end

end
