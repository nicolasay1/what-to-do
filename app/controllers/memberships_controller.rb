class MembershipsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    if params[:query].present?
      @user_to_add = User.find_by(email: params[:query])
    else
      # MEMBERSHIP INVITE LINK
      if user_signed_in?
        create
      else
        redirect_to new_user_registration_path(invite_token: params[:group_invite_token])
      end
    end
  end

  def create
    @group = Group.find_by_invite_token(params[:group_invite_token])
    Membership.where(group: @group, user: current_user).first_or_create
    redirect_to group_path(@group)
  end

  def destroy
  end

end
