class Backoffice::EventController < Backoffice::ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
