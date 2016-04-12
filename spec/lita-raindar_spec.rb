require "lita-raindar"

describe Lita::Handlers::Raindar, lita_handler: true do

  describe 'routing' do
    let(:handler) { Lita::Handlers::Raindar.new(robot) }

    it "responds to 'lita weather melbourne'" do
      expect(handler).to route("lita weather melbourne").to(:radar)
    end

    it "responds to 'lita weather sydney'" do
      expect(handler).to route("lita weather sydney").to(:radar)
    end

    it "responds to 'lita weather wagga wagga'" do
      expect(handler).to route("lita weather wagga wagga").to(:radar)
    end
  end

  describe '.radar' do
    let(:handler) { Lita::Handlers::Raindar.new(robot) }
    let(:location) { "lita weather melbourne" }
    let(:url_cache) { instance_double(UrlCache, cached_radar_url: true ) }

    before do
      allow(UrlCache).to receive(:new) { url_cache }
    end

    context 'when user requests Melbourne as downcase' do
      let(:response) { double(match_data: ['weather melbourne', 'melbourne'], reply: true) }
      it 'responds to specific argument' do
        handler.radar(response)
        expect(url_cache).to have_received(:cached_radar_url).with("IDR023")
      end
    end

    context 'when user requests Melbourne as upcase' do
      let(:response) { double(match_data: ['weather Melbourne', 'Melbourne'], reply: true) }
      it 'responds to specific argument' do
        handler.radar(response)
        expect(url_cache).to have_received(:cached_radar_url).with("IDR023")
      end
    end

    context 'when user requests Sydney' do
      let(:response) { double(match_data: ['weather sydney', 'sydney'], reply: true) }
      it 'responds to specific argument' do
        handler.radar(response)
        expect(url_cache).to have_received(:cached_radar_url).with("IDR713")
      end
    end

    context 'when user requests Wagga Wagga' do
      let(:response) { double(match_data: ['weather wagga wagga', 'wagga wagga'], reply: true) }
      it 'responds to specific argument' do
        handler.radar(response)
        expect(url_cache).to have_received(:cached_radar_url).with("IDR553")
      end
    end

    context 'when user requests a location without a radar' do
      let(:response) { double(match_data: ['weather other location''other location'], reply: true) }
      it 'responds to specific argument' do
        handler.radar(response)
        expect(url_cache).to_not have_received(:cached_radar_url)
        expect(response).to have_received(:reply).with("Location not currently available")
      end
    end

  end

end
