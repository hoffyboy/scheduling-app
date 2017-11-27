class EventsController < ApplicationController
  include EventHelper
  before_action :set_variables

  def new
    check_availability_days
    check_availability_times if params[:date]
  end

  def create
    @client_booking_time = @client&.bookings&.first&.time

    if @client_booking_time.try(:>, Time.now)
      @client.bookings.last.destroy
      @client.book!(@event, time: params[:time].to_time, amount: 1)

      flash[:notice] = "A booking with the email address #{@client.email} has previously been scheduled for #{@client_booking_time.to_time.strftime('%l:%M%P on %A, %B %d, %Y')}. The booking has been rescheduled for #{params[:time].to_time.strftime('%I:%M%P on %A, %B %d, %Y')}."
      redirect_to welcome_index_path
    else
      @client.book!(@event, time: params[:time].to_time, amount: 1)
      flash[:notice] = "Confirmed for #{params[:time].to_time.strftime('%l:%M%P on %A, %B %d, %Y')}."
      redirect_to welcome_index_path
    end
  end

  private

  def set_variables
    @client = Client.find(session[:client_id])
    @event = Event.first
  end
end
