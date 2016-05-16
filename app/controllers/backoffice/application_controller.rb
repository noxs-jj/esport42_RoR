class Backoffice::ApplicationController < ActionController::Base
  before_action :check_is_login?

  layout 'backoffice'

  def check_is_login?
    if user_signed_in? && current_user.admin?
    else
      redirect_to root_path, alert: "Access forbidden"
    end
  end
end
