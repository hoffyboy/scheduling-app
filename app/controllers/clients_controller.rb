class ClientsController < ApplicationController

  def new
    @client = Client.new
    @client.build_watch
    flash[:time] ||= params[:time]&.to_time
    flash.keep
  end

  def create
    @client = Client.find_or_create_by(email: params[:client][:email])
    @client = Client.new(client_params)
    @event = Event.first
    @client_booking_time = @client&.bookings&.first&.time

    if @client_booking_time.try(:>, Time.now)
      @client.update(first_name: params[:client][:first_name], last_name: params[:client][:last_name], phone: params[:client][:phone] )
      @client.bookings.destroy_all
      @client.book!(@event, time: flash[:time].to_time, amount: 1)

      flash[:notice] = "A booking with the email address #{@client.email} has previously been scheduled for #{@client_booking_time.to_time.strftime('%l:%M%P on %A, %B %d, %Y')}. The booking has been rescheduled for #{flash[:time].to_time.strftime('%I:%M%P on %A, %B %d, %Y')}."
      redirect_to events_path

    elsif @client.save
      @client.book!(@event, time: flash[:time].to_time, amount: 1)
      flash[:notice] = "Confirmed for #{flash[:time].to_time.strftime('%l:%M%P on %A, %B %d, %Y')}."
      redirect_to events_path

    else
      flash[:time] = flash.now[:time]
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email, :phone, watch_attributes: [:brand, :model, :condition, :price])
  end

end
