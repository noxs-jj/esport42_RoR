class Backoffice::PostController < Backoffice::ApplicationController
  require 'open-uri'

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to backoffice_post_index_path,
                  alert: "Post #{params[:id].to_s} doesn't exist"
    end
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    if post
      redirect_to backoffice_post_show_path(post.id), notice: 'Create success'
    else
      redirect_to backoffice_post_new_path,
                  alert: 'Create failed, plz contact admin'
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.nil?
      redirect_to backoffice_post_index_path,
                  alert: "Post #{params[:id].to_s} doesn't exist"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.nil?
      redirect_to backoffice_post_index_path,
                  alert: "Post #{params[:id].to_s} doesn't exist"
    else
      if @post.update(post_params)
        redirect_to backoffice_post_show_path(@post.id),
                    notice: 'Update success'
      else
        redirect_to backoffice_post_index_path,
                    alert: 'Failed to update post.'
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :user_id, :visible, :banner, :title, :description, :body, :sources
    )
  end
end
