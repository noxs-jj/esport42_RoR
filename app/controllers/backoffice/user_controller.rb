class Backoffice::UserController < Backoffice::ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
