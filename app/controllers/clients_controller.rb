class ClientsController < ApplicationController

  def new
    @client = Client.new
    @client.build_watch
  end

  def create
    @client = Client.find_or_initialize_by(email: params[:client][:email])
    @client.assign_attributes(client_params)

    if @client.save
      session[:client_id] = @client.id
      redirect_to new_event_path
    else
      render :new
    end

  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email, :phone, watch_attributes: [:client_id, :brand, :model, :condition, :price])
  end

end
