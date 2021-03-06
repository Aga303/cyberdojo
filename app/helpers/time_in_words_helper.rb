require 'plural_helper'

module TimeInWordsHelper

  include PluralHelper

  # Something akin to git log --relative-date option  
  # currently unused - I planned to use this (or something built on this)
  # to show a tool-tip for ... ellision on the dashboard
  # However, my current plan is to limit each dojo to 60 minutes
  # (to control server load in preparation for moving to cloud)
  # in which case this won't be needed...
  
  def time_in_words(seconds)
    years,days,hours,minutes,seconds = time_split(seconds)
  
    if years > 0
      t = plural(years, 'year')
    elsif days > 0
      t = plural(days, 'day')
    elsif hours > 0
      t = plural(hours, 'hour')
    elsif minutes > 0
      t = plural(minutes, 'min')
    else  
      t = plural(seconds, 'sec')
    end
    
    '>' + t   
  end
  
  def time_split(seconds)
    minutes,seconds = seconds.divmod(60)
    hours,minutes = minutes.divmod(60)
    days,hours = hours.divmod(24)
    years,days = days.divmod(365)
    
    [years,days,hours,minutes,seconds]
  end
  
  def time_unsplit(years, days, hours, minutes, seconds)
    seconds_per_min  = 60
    seconds_per_hour = 60*60
    seconds_per_day  = 24*60*60
    seconds_per_year = 365*24*60*60
  
    years * seconds_per_year + 
    days * seconds_per_day + 
    hours * seconds_per_hour + 
    minutes * seconds_per_min +
    seconds
  end
  
end