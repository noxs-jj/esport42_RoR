class Backoffice::PostController < Backoffice::ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to backoffice_post_index_path, alert: "Post #{params[:id].to_s} doesn't exist"
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
      redirect_to backoffice_post_show_path(post.id), notice: "Create success"
    else
      redirect_to backoffice_post_new_path, alert: "Create failed, plz contact admin"
    end
  end

  def edit
  end

  def update
  end

private
  def post_params
    params.require(:post).permit(
      :user_id, :visible, :banner, :title, :description, :body, :sources
    )
  end
end
