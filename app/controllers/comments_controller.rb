class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
    
  def show
    @comment = Comment.find(params[:id])
  end

  #def new
   # @place = Place.find(params[:place_id])
    #@comment = Comment.new
  #send

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'コメント投稿が完了しました'
      redirect_back(fallback_location: root_path)
    else
      @comments = current_user.comments.order('created_at DESC').page(params[:page])
      flash[:danger] = 'コメント投稿に失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'コメントを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:image, :place_id, :image_date, :content)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
