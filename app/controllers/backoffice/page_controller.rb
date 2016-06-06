class Backoffice::PageController < Backoffice::ApplicationController
  include MenuCategoryHelper

  def index
    @pages = Page.all.page(params[:page])
  end

  def show
    @page = Page.find_by(id: params[:id])
    if @page.nil?
      redirect_to backoffice_page_index_path,
                  alert: "Page #{params[:id].to_s} doesn't exist"
    end
  end

  def new
    @page = Page.new
  end

  def create
    page = Page.new(page_params)
    page.save
    if page
      redirect_to backoffice_page_show_path(page.id),
                  notice: "Page created success"
    else
      redirect_to backoffice_page_index_path,
                  alert: "Page failed, plz contact admin"
    end
  end

  def edit
    @page = Page.find(params[:id])
    if @page.nil?
      redirect_to backoffice_page_index_path,
                  alert: "Page #{params[:id].to_s} doesn't exist"
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.nil?
      redirect_to backoffice_page_index_path,
                  alert: "Page #{params[:id].to_s} doesn't exist"
    else
      if @page.update(page_params)
        redirect_to backoffice_page_show_path(@page.id),
                    notice: "Update success"
      else
        redirect_to backoffice_page_index_path,
                    alert: "Failed to update page."
      end
    end
  end

  private

  def page_params
    params.require(:page).permit(:menu_category_id, :name, :description, :body, :banner, :visible)
  end
end
