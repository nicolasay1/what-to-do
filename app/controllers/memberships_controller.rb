class MembershipsController < ApplicationController
  before_action :set_user_to_add, :set_group
  skip_before_action :authenticate_user!, only: :new

  def new
    if user_signed_in?
      @user = Membership.new
      if params[:query].present?
        users = User.all
      elsif params[:invite_token].present?
        # MEMBERSHIP INVITE LINK
        create
      end
    else
      redirect_to new_user_registration_path(invite_token: params[:invite_token]) if params[:invite_token].present?
    end
  end

  def create
    if params[:invite_token].present?
      @group = Group.find_by_invite_token(params[:invite_token])
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
    query = params[:query]
    puts params[:query]

    if query.present?
      @suggested_users = User.where("first_name ILIKE :query OR email ILIKE :query", query: "%#{params[:query]}%")
    end

  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def membership_params
    params.require(:membership).permit(:group, :group_id, :user_id, :admin)
  end
end
