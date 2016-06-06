class WelcomeController < ApplicationController
  def index
    @posts = Post.where(visible: true).order(created_at: :desc).limit(5)
    @post_highlight = Post.where(highlight: true).first
  end
end
