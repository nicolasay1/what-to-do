class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.where(group_id: params[:group_id])
  end

  def show
    @proposal = Proposal.find(params[:id])
    @like = Like.where(proposal_id: @proposal.id, user_id: current_user.id).first
  end

  def create
    if Proposal.create(group_id: params[:group_id], activity_id: params[:activity_id])
      head 201
    else
      head 500
    end
  end
end
