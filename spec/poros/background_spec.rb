require 'rails_helper'

RSpec.describe Background do
  before :each do
    @background = BackgroundsFacade.get_photo('denver,co')
  end

  it 'exists', :vcr do
    expect(@background).to be_a(Background)
  end
end
