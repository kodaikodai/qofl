class LikesController < ApplicationController

#-----いいねをする------
  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    @like.save
    # いいね後のpost情報を代入↓↓
    @post = Post.find(params[:post_id])
    # if @like.save
    #   redirect_to post_path(id: params[:post_id])
    # end
  end

# -----いいねを解除する-----
  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    # いいね削除後のpost情報を代入↓↓
    @post = Post.find(params[:post_id])
    # if like.destroy
    #   redirect_to post_path(post_id: params[:post_id])
    # end
  end
end
