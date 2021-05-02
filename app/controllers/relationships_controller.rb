class RelationshipsController < ApplicationController


  def create
    user = User.find(params[:follow_id])
    current_user.follow(params[:follow_id])
    redirect_to request.referer
  end

  def destroy
    Relationship.find_by(follower_id: current_user.id, followed_id: params[:id]).destroy
    redirect_to request.referer
  end

end