class UsersController < ApplicationController

  def show
    post = Post.find(params[:id])
    @nickname = post.user.nickname
    @posts = post.user.posts
  end
end
