class FavoritesController < ApplicationController
      before_action :authenticate_user!
   def create
    @sake = Sake.find(params[:sake_id])
    @favorite = current_user.favorites.create(sake_id: params[:sake_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @sake = Sake.find(params[:sake_id])
    favorite = current_user.favorites.find_by(sake_id: @sake.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  end