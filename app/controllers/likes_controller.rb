class LikesController < ApplicationController

  def create
    if Like.create(proposal_id: params[:proposal_id], user_id: current_user.id, liked: params[:liked])
      @proposal = Proposal.find(params[:proposal_id])
      redirect_to proposal_path(@proposal)
    else
      head 500
    end
  end

end
