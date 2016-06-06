class PostController < ApplicationController
  def index
    @posts = Post.where(visible: true).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to post_index_path,
                  alert: "Post #{params[:id].to_s} doesn't exist"
    elsif false == @post.visible
      redirect_to post_index_path,
                  alert: "Post #{params[:id].to_s} is private"
    end
  end
end
