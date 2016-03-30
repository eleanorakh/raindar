require "lita-raindar"
require "lita/rspec"
require "spec_helper"

describe Raindar do
  it 'has a version number' do
    expect(Raindar::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
