class WelcomeController < ApplicationController
  def index
    @posts = Post.all.limit(5)
  end
end
