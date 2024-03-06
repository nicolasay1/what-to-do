class MembershipsController < ApplicationController
  before_action :set_user_to_add, :set_group
  skip_before_action :authenticate_user!, only: :new

  def new
    if user_signed_in?
      @user = Membership.new
      if params[:query].present?
        users = User.all
      else
        # MEMBERSHIP INVITE LINK
        create
      end
    else
      redirect_to new_user_registration_path(invite_token: params[:group_invite_token])
    end
  end

  def create
    if params[:group_invite_token].present?
      @group = Group.find_by_invite_token(params[:group_invite_token])
      Membership.where(group: @group, user: current_user).first_or_create
      redirect_to group_path(@group)
    else
      @new_member = Membership.new(membership_params)
      if @new_member.save
        redirect_to group_path(@group)
        flash[:notice] = "Member added successfully"
      else
        flash[:notice] = "There was an issue"
      end
    end
  end

  def destroy
    @member = Membership.find_by(membership_params)
    if @member.destroy
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
