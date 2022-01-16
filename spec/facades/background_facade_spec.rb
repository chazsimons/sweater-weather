require 'rails_helper'

RSpec.describe BackgroundsFacade do
  before :each do
    @background = BackgroundsFacade.get_photo('denver,co')
  end

  it 'returns an image from unsplash.com', :vcr do
    expect(@background).to be_an_instance_of(Background)
  end

  it 'has readable attributes', :vcr do
    expect(@background.location).to eq("Downtown Denver, Denver, CO, USA")
    expect(@background.image_url).to eq("https://images.unsplash.com/photo-1626157854457-df0cd78d0c52?ixid=MnwyOTE1MTZ8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NDIzNjMxOTc&ixlib=rb-1.2.1")
    expect(@background.credits).to be_a(Hash)
    expect(@background.credits[:author]).to eq('selbotron')
    expect(@background.credits[:author_url]).to eq('https://unsplash.com/@selbotron')
    expect(@background.credits[:source]).to eq('unsplash.com')
  end
end
