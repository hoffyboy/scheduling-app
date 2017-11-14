class EventsController < ApplicationController
  include EventHelper

  def index
    @client = Client.first
    @event = Event.first
    check_availability_days
    check_availability_times if params[:date]
  end


  def destroy
    @client = Client.first
    @client.bookings.first.destroy
    redirect_to event_path(date: params[:time])
  end


  private

  def book_time_slot(time)
    @client.bookings.destroy_all
    @client.book!(@event, time: time, amount: 1)
  end
end
