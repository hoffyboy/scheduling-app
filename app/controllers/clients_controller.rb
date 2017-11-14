class ClientsController < ApplicationController

  def new
    @client = Client.new
    flash[:time] = params[:time].to_time
    p flash[:time].strftime('%I:%M%P - %A, %B %d, %Y')
  end

  def create
    @client = Client.new(client_params)
    @event = Event.first
    @existing_client = Client.find_by(email: params[:client][:email])
    @existing_client_booking_time = @existing_client.try(:bookings).first.try(:time)



    if @client.save
      @client.book!(@event, time: flash[:time].to_time, amount: 1)
      flash[:notice] = "New client saved. Confirmed for #{flash[:time].to_time.strftime('%l:%M%P on %A, %B %d, %Y')}."
      redirect_to events_path

    elsif !@client.save && @existing_client_booking_time.try(:>, Time.now)
        flash[:notice] = "A booking with the email address #{@existing_client.email} has previously been scheduled for #{@existing_client_booking_time.to_time.strftime('%l:%M%P on %A, %B %d, %Y')}. The booking has been rescheduled to #{flash[:time].to_time.strftime('%I:%M%P on %A, %B %d, %Y')}."
        redirect_to events_path

    elsif !@client.save && @existing_client
      @existing_client.book!(@event, time: flash[:time].to_time, amount: 1)
      flash[:notice] = "Confirmed for #{flash[:time].to_time.strftime('%l:%M%P on %A, %B %d, %Y')}."
      redirect_to events_path

    else
      flash.now[:alert] = "There was an error confirming your booking. Please try again."
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:email)
  end

end
