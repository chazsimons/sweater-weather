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
    @travel_time   = data[:route][:formattedTime]
    @time_in_hrs   = (data[:route][:realTime] / 3600)
    @lat           = data[:route][:boundingBox][:ul][:lat]
    @lng           = data[:route][:boundingBox][:ul][:lng]
  end

  def travel_possible(data)
    
  end
end
