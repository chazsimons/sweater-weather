class HourlyWeather
  attr_reader :time,
              :tempature,
              :conditions,
              :icon
              
  def initialize(data)
    @time       = Time.at(data[:dt]).to_datetime
    @tempature  = data[:temp]
    @conditions = data[:weather].first[:description]
    @icon       = data[:weather].first[:icon]
  end
end
