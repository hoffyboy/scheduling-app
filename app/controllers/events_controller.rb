class EventsController < ApplicationController
  include EventHelper

  def index
    @event = Event.first
    check_availability_days
    check_availability_times if params[:date]
  end
end
