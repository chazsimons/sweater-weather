class BackgroundSerializer

  def self.serialize(data)
    {data: { id: 'null', type: 'image', attributes: {  image: data }}}
  end
end
