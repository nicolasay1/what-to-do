class GroupsController < ApplicationController

  def index
    #Index of groups that the current_user belongs to
    user_groups = current_user.memberships
    @groups = user_groups.map(&:group)

  end

  def show
    @group = Group.find(params[:id])
    @members = @group.users
    @invite_link = "#{request.original_url}/memberships/new?invite_token=#{@group.invite_token}"
    @events = Event.where(group_id: @group.id, booked: nil)
    @bookings = Event.where(group_id: @group.id, booked: true).order(date: :asc)
    @chatroom = @group.chatroom
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    @chatroom = Chatroom.create(group: @group, name: @group.name)
    if @group.save
      add_to_group_member
      flash[:notice] = "Group created successfully 🎉!"
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
    @members = @group.users
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
    params.require(:group).permit(:name, :description, :banner)
  end

  def add_to_group_member
    @member = Membership.new
    @member.group = @group
    @member.user = current_user
    @member.admin = true
    @member.save
  end


end
