require 'url_cache'

describe UrlCache do
  describe '.cached_radar_url' do
    let(:radar_code) { "radar_code" }
    let(:url_cache) { UrlCache.new instance_double(Redis, get: 'url') }

    it 'caches the url returned by the radar generator' do
      expect(url_cache.cached_radar_url(radar_code)).to eq 'url'
    end
  end

end
