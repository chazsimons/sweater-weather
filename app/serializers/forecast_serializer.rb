class ForecastSerializer
  include JSONAPI::Serializer

  attributes :current_weather, :hourly_weather, :daily_weather

  attribute :current_weather do |c|
    c.datetime
    c.sunrise
    c.sunset
    c.temp
    c.feels_like
    c.humidity
    c.visibility
    c.uvi
    c.conditions
    c.icon
  end

  attribute :hourly_weather do |h|
    h.time
    h.tempature
    h.conditions
    h.icon
  end

  attribute :daily_weather do |d|
    d.date
    d.sunrise
    d.sunset
    d.max_temp
    d.min_temp
    d.conditions
    d.icon
  end
  # attributes :id, :datetime, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon
  # {
  #   "data": [
  #  {
  #    "id": "1",
  #    "type": "forecast",
  #    "attributes": {
  #      current_weather: {
  #        datetime:   :datetime,
  #        sunrise:    :sunrise,
  #        sunset:     :sunset,
  #        temp:       :temp,
  #        feels_like: :feels_like,
  #        humidity:   :humidity,
  #        uvi:        :uvi,
  #        visibility: :visibility,
  #        conditions: :conditions,
  #        icon:       :icon
  #      },
  #      daily_weather: [
  #        date:       :date,
  #        sunrise:    :sunrise,
  #        sunset:     :sunset,
  #        max_temp:   :max_temp,
  #        min_temp:   :min_temp,
  #        conditions: :conditions,
  #        icon:       :icon,
  #      ],
  #      hourly_weather: [
  #        time:       :time,
  #        tempature:  :tempature,
  #        conditions: :conditions,
  #        icon:       :icon
  #      ]
  #    }
  #  }]
  # }
end
