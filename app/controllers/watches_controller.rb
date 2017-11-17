class WatchesController < ApplicationController
  def new
    @watch = Watch.new
  end

  def create
    @client = Client.find_or_create_by(email: params[:email])
    @watch = @client.watches.new(watch_params)
  end

  private

  def watch_params
    params.require(:watch).permit(:brand, :model, :condition, :price)
  end
end
