class ForecastSerializer

  def self.serialize(data)
    {data: { id: 'null', type: 'forecast', attributes: data}}
  end
end
