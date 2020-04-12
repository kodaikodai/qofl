class LikesController < ApplicationController
#-----いいねをする------
  def create
    # 現在のユーザーがこの投稿に対していいねする↓↓
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    # この投稿のいいね数を全て代入↓↓
    @likes = Like.where(post_id: params[:post_id])
    # この投稿の情報を全て代入する↓↓
    @posts = Post.all
  end

# -----いいねを解除する-----
  def destroy
    # 現在のユーザーのこの投稿に対してのいいねを代入↓↓
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    # この投稿に対するいいねの情報を全て代入↓↓
    @likes = Like.where(post_id: params[:post_id])
    # この投稿の情報を全て代入する↓↓
    @posts = Post.all
  end
end
