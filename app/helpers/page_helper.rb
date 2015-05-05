module PageHelper

  def calendar(month, year)
    current_date = Date.new(year, month, 1)
    last_day = Date.new(year, month, -1)
    day_of_week = current_date.strftime("%w").to_i

    prev_month = month - 1
    prev_year = year
    if prev_month <= 0
      prev_month = 12
      prev_year = year - 1
    end

    next_month = month + 1
    next_year = year
    if next_month >= 13
      next_month = 1
      next_year = year + 1
    end

    ret_str = "<h1>#{current_date.strftime("%B")} #{current_date.year}</h1>"

    ret_str += "<table id='calendar'><tr>"

    ret_str += "<th>"
    ret_str += link_to("<< Prev", calendar_path(:year => prev_year, :month => prev_month))
    ret_str += "</th><th colspan='5'>&nbsp;</th><th>"
    ret_str += link_to("Next >>", calendar_path(:year => next_year, :month => next_month))
    ret_str += "</th></tr><tr>"

    # First row - day headers
    days = %w(Sun Mon Tue Wed Thu Fri Sat)
    days.each do |day|
      ret_str += "<th>#{day}</th>"
    end

    ret_str += "</tr><tr>"

    # Second row - first week of month
    day_of_week.times do
      ret_str += "<td>&nbsp;</td>"
    end

    day_count = 1
    (7 - day_of_week).times do |day|
      ret_str += "<td>#{day + 1}</td>"
      day_count += 1
    end

    ret_str += "</tr><tr>"

    # Third rows until end of month
    until day_count > (last_day.day - 7) do
      7.times do
        ret_str += "<td>#{day_count}</td>"
        day_count += 1
      end
      ret_str += "</tr><tr>"
    end

    # Special final week of month
    last_week = (last_day.day + 1) - day_count
    last_week.times do
      ret_str += "<td>#{day_count}</td>"
      day_count += 1
    end

    (7 - last_week).times do
      ret_str += "<td>&nbsp;</td>"
    end

    ret_str += "</tr></table>"

    return ret_str
  end

end
