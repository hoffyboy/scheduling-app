class ScheduleController < ApplicationController
  def index
  end

  def show
    @client = Client.first
    @schedule = Schedule.first
  end

  def post
    @client = Client.first
    @schedule = Schedule.first
    book_time_slot(params[:hour].to_i)
  end
end

private

def book_time_slot(i)
  @client.book!(@schedule, time: Date.today + i.hours, amount: 1)
end
