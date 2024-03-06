class GroupsController < ApplicationController

  def index
    #Index of groups that the current_user belongs to
    user_groups = current_user.memberships
    @groups = user_groups.map(&:group)

  end

  def show
    @group = Group.find_by(invite_token: params[:invite_token])
    @members = @group.users
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      add_to_group_member
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to(@group)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to groups_path
    else
      render :destroy, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def add_to_group_member
    @member = Membership.new
    @member.group = @group
    @member.user = current_user
    @member.admin = true
    @member.save
  end


end
