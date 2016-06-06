class Backoffice::PostController < Backoffice::ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page])
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

  def set_visible
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to backoffice_post_index_path,
                  alert: "Post #{params[:id].to_s} doesn't exist"
    end
    @post.visible = true
    @post.save
    if @post
      redirect_to  backoffice_post_index_path,
                  notice: 'Set visible success'
    else
      redirect_to backoffice_post_index_path,
                  alert: 'Failed to set visible.'
    end
  end

  def set_invisible
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to backoffice_post_index_path,
                  alert: "Post #{params[:id].to_s} doesn't exist"
    end
    @post.visible = false
    @post.save
    if @post
      redirect_to backoffice_post_index_path,
                  notice: 'Set invisible success'
    else
      redirect_to backoffice_post_index_path,
                  alert: 'Failed to set invisible.'
    end
  end

  def set_highlight
    @old_highlight_post = Post.find_by(highlight: true)
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to backoffice_post_index_path,
                  alert: "Post #{params[:id].to_s} doesn't exist"
    elsif @old_highlight_post
      @old_highlight_post.highlight = false
      @old_highlight_post.save
    end
    @post.highlight = true
    @post.visible = true
    @post.save
    if @post
      redirect_to backoffice_post_index_path,
                  notice: 'Set highlight success'
    else
      redirect_to backoffice_post_index_path,
                  alert: 'Failed to set highlight.'
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :user_id, :visible, :banner, :title, :description, :body, :sources
    )
  end
end
