module EventHelper

  def check_availability_days
    @available_days = []

    7.times do |i|
      if @event.schedule.occurs_on?(Date.tomorrow + i)
        @available_days << Date.tomorrow + i
      end
    end
  end

  def check_availability_times
    @available_times = []
    current_time = Time.now.strftime('%T %z').to_s
    selected_day = params[:date].try(:to_date)

    if selected_day == Date.today
      from_time = Time.parse(current_time, params[:date].to_time)
    else
      from_time = selected_day
    end

    @selected_days_occurrences = @event.schedule.occurrences_between(from_time, selected_day + 1.day)

    @selected_days_occurrences.each do |time|
      if @event.check_availability(time: time, amount: 1) == true
          @available_times << time
      end
    end
  end

end
