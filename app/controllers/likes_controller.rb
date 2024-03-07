class LikesController < ApplicationController

  def create
    if Like.create(proposal_id: params[:proposal_id], user_id: current_user.id, liked: params[:liked])
      head 201
    else
      head 500
    end
  end

end
