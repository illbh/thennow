class PlacesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @places = Place.all.page(params[:page])
  end
  
  def show
    @place = Place.includes(:user).find(params[:id])
    @comments = @place.comments.includes(:user).all
    @comment = @place.comments.build(user_id: current_user.id) if current_user
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = current_user.places.build(place_params)
    
    if @place.save
      flash[:success] = '投稿が完了しました'
      redirect_to places_path
    else
      @places = current_user.places.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '投稿に失敗しました'
      render new_place_path
    end
  end
  
  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    flash[:success] = 'メッセージを削除しました'
    redirect_to places_path
  end
  
  def newcomment
    @place = Place.find(params[:id])
    @comment = Comment.new
  end
  
  private
  
  def place_params
    params.require(:place).permit(:image, :adress, :image_date, :content)
  end
  
  def correct_user
    @place = current_user.places.find_by(id: params[:id])
    unless @place
      redirect_to root_url
    end
  end
end
