class Trip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :time_in_hrs,
              :lat,
              :lng

  def initialize(origin, destination, data)
    @start_city    = origin
    @end_city      = destination
    if !data[:route].has_key?(:distance)
      @travel_time   = data[:info][:messages].first
      @time_in_hrs   = 1000
      @lat           = 45.10111
      @lng           = 167.46468
    else
      @travel_time   = data[:route][:formattedTime]
      @time_in_hrs   = (data[:route][:realTime] / 3600)
      @lat           = data[:route][:boundingBox][:ul][:lat]
      @lng           = data[:route][:boundingBox][:ul][:lng]
    end
  end

  # def travel_possible(data)
  #   if data[:route].has_key?(:routeError)
  #     data[:info][:messages].first
  #   else
  #     data[:route][:formattedTime]
  #   end
  # end
  #
  # def time_convert(data)
  #   if data[:route].has_key?(:routeError)
  #     1000
  #   else
  #     (data[:route][:realTime] / 3600)
  #   end
  # end
  #
  # def lat_finder(data)
  #   if data[:route].has_key?(:routeError)
  #     45.10111
  #   else
  #     data[:route][:boundingBox][:ul][:lat]
  #   end
  # end
  #
  # def lng_finder(data)
  #   if data[:route].has_key?(:routeError)
  #     167.46468
  #   else
  #     data[:route][:boundingBox][:ul][:lng]
  #   end
  # end
end
