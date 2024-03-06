class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.where(group_id: params[:group_id])
  end

  def create
    if Proposal.create(group_id: params[:group_id], activity_id: params[:activity_id])
      head 201
    else
      head 500
    end
  end
end
