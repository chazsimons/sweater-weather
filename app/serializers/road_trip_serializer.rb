class RoadTripSerializer

  def self.serialize(data)
    { data: { id: 'null', type: 'roadtrip', attributes: data } }
  end
end
