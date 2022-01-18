require 'rails_helper'

RSpec.describe BooksFacade do

  it 'can establish a Faraday connection' do
    expect(BooksFacade.conn).to be_a(Faraday::Connection)
  end
end
