class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @datetime   = Time.at(data[:dt]).to_datetime
    @sunrise    = Time.at(data[:sunrise]).to_datetime
    @sunset     = Time.at(data[:sunset]).to_datetime
    @temp       = data[:temp]
    @feels_like = data[:feels_like]
    @humidity   = data[:humidity]
    @uvi        = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon       = data[:weather].first[:icon]
  end
end
