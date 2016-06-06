class PageController < ApplicationController
  def show
    @page = Page.find_by(id: params[:id])
    if @page.nil?
      redirect_to backoffice_page_index_path,
                  alert: "Page #{params[:id].to_s} doesn't exist"
    end
  end
end
