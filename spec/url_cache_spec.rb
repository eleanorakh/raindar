require 'url_cache'

describe UrlCache do
  describe '.cached_radar_url' do
    let(:radar_code) { "radar_code" }

    before do
      stub_const("UrlCache::REDIS", instance_double(Redis, get: 'url'))

    end
    it 'caches the url returned by the radar generator' do
      expect(UrlCache.cached_radar_url(radar_code)).to eq 'url'
    end
  end

end
