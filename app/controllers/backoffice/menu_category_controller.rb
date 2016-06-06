class Backoffice::MenuCategoryController < Backoffice::ApplicationController
  def index
    @menus = MenuCategory.all.page(params[:page])
  end

  def new
    @menu = MenuCategory.new
  end

  def create
    menu = MenuCategory.new(menu_params)
    menu.save
    if menu
      redirect_to backoffice_menu_category_index_path,
                  notice: "Menu created success"
    else
      redirect_to backoffice_menu_category_index_path,
                  alert: "Menu failed, plz contact admin"
    end
  end

  def edit
    @menu = MenuCategory.find(params[:id])
    if @menu.nil?
      redirect_to backoffice_menu_category_index_path,
                  alert: "MenuCategory #{params[:id].to_s} doesn't exist"
    end
  end

  def update
    @menu = MenuCategory.find(params[:id])
    if @menu.nil?
      redirect_to backoffice_menu_index_path,
                  alert: "MenuCategory #{params[:id].to_s} doesn't exist"
    else
      if @menu.update(menu_params)
        redirect_to backoffice_menu_category_index_path,
                    notice: "Update success"
      else
        redirect_to backoffice_menu_category_index_path,
                    alert: "Failed to update menu."
      end
    end
  end

  private

  def menu_params
    params.require(:menu_category).permit(:name, :color, :visible)
  end
end
