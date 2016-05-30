class Backoffice::UserController < Backoffice::ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
  end

private
  def user_params
    params.require(:user).permit(
      :username, :adress_line1, :adress_line2, :adress_line3, :adress_city,
      :adress_province, :adress_postalcode, :adress_country, :adress_otherDetails,
      :adress_postalcode, :adress_country, :adress_otherDetails,
      :skype_id, :email_secondary, :phone_mobile, :phone_home, :steam_id,
      :battlenet_id, :origin_id, :maniaplanet_id, :xbox_live, :sony_psn,
      :website_url, :facebook_private_url, :facebook_gamer_url, :youtube_url,
      :twitch_url, :googleplus_url, :sponsor, :quote, :pc_cpu, :pc_ram,
      :pc_graphic_card, :pc_motherboard, :pc_keyboard, :pc_mouse, :pc_mousepad,
      :pc_screen, :pc_internet, :pc_harddisk, :pc_soundcard, :pc_cpu_fan,
      :pc_computer_case, :pc_alim, :pc_os_sytem, :pc_smarphone
    )
  end
end
