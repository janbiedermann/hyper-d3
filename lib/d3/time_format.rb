module D3
  class TimeFormatLocale
    include D3::Native
    aliases_native %i[format utcFormat parse utcParse]
  end

  class << self
    aliases_d3 %i[
      timeFormat
      timeParse
      utcFormat
      utcParse
      isoFormat
      isoParse
    ]

    def time_format_locale(spec={})
      D3::TimeFormatLocale.new @d3.JS.timeFormatLocale(
        {
          dateTime: spec.fetch(:date_time, "%x, %X"),
          date: spec.fetch(:date, "%-m/%-d/%Y"),
          time: spec.fetch(:time, "%-I:%M:%S %p"),
          periods: spec.fetch(:periods, ["AM", "PM"]),
          days: spec.fetch(:days, ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]),
          shortDays: spec.fetch(:short_days, ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]),
          months: spec.fetch(:months, ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]),
          shortMonths: spec.fetch(:short_months, ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]),
        }.to_n
      )
    end

    def time_format_default_locale(spec={})
      D3::TimeFormatLocale.new @d3.JS.timeFormatDefaultLocale(
        {
          dateTime: spec.fetch(:date_time, "%x, %X"),
          date: spec.fetch(:date, "%-m/%-d/%Y"),
          time: spec.fetch(:time, "%-I:%M:%S %p"),
          periods: spec.fetch(:periods, ["AM", "PM"]),
          days: spec.fetch(:days, ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]),
          shortDays: spec.fetch(:short_days, ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]),
          months: spec.fetch(:months, ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]),
          shortMonths: spec.fetch(:short_months, ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]),
        }.to_n
      )
    end
  end
end
