module ApplicationHelper

  def time_in_ms(time)
    (time.to_f * 1000.0).to_i
  end

  def date_to_time(date)
    Time.new(date.year, date.month, date.day)
  end

  def date_in_ms(date)
    time_in_ms(date_to_time(date))
  end

end