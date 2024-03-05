class GroupsController < ApplicationController

  def index
    #Index of groups that the current_user belongs to
    @groups = Group.where(user: current_user)
  end

  def show
    @group = Group.find(params[:id])
    @members = GroupMember.where(group: Group.find(params[:id]))
    # @user = User.where("email = ?", params[:query]).first
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
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def add_to_group_member
    @member = GroupMember.new
    @member.group = @group
    @member.user = current_user
    @member.save
  end


end
