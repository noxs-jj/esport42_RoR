class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to post_index_path, alert: "Post #{params[:id].to_s} doesn't exist"
    end
  end
end
