class ProposalsController < ApplicationController
  def create
    if Proposal.create(group_id: params[:group_id], activity_id: params[:activity_id])
      head 201
    else
      head 500
    end
  end
end
