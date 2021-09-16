Time::DATE_FORMATS[:tiny_date] = '%m/%d/%Y'                         # 2/22/1983
Time::DATE_FORMATS[:tiny_date_time] = '%m/%d/%Y at %l:%M %p'        # 2/22/1983 at 8:33 AM
Time::DATE_FORMATS[:month_day_time] = "%B %e at %l:%M %p"           # February 22 at 8:33 AM
Time::DATE_FORMATS[:month_day_year_time] = "%B %e, %Y at %l:%M %p"  # February 22, 1983 at 8:33 AM

Date::DATE_FORMATS[:abbrev_month_day] = "%b %-d"                    # Feb 1
Date::DATE_FORMATS[:month_day_year]  = "%B %e, %Y"                  # February 22, 1983


#   %a - The abbreviated weekday name (``Sun'')
#   %A - The  full  weekday  name (``Sunday'')
#   %b - The abbreviated month name (``Jan'')
#   %B - The  full  month  name (``January'')
#   %c - The preferred local date and time representation
#   %d - Day of the month (01..31)
#   %H - Hour of the day, 24-hour clock (00..23)
#   %I - Hour of the day, 12-hour clock (01..12)
#   %l - Hour of the day, 12-hour clock (1..12) !without leading zero!
#   %j - Day of the year (001..366)
#   %m - Month of the year (01..12)
#   %M - Minute of the hour (00..59)
#   %p - Meridian indicator (``AM''  or  ``PM'')
#   %S - Second of the minute (00..60)
#   %U - Week  number  of the current year,
#           starting with the first Sunday as the first
#           day of the first week (00..53)
#   %W - Week  number  of the current year,
#           starting with the first Monday as the first
#           day of the first week (00..53)
#   %w - Day of the week (Sunday is 0, 0..6)
#   %x - Preferred representation for the date alone, no time
#   %X - Preferred representation for the time alone, no date
#   %y - Year without a century (00..99)
#   %Y - Year with century
#   %Z - Time zone name
#   %% - Literal ``%'' character
