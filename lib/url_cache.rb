require 'redis'
require 'radar_generator'

class UrlCache
  CACHE_EXPIRY = 300 # seconds

  def initialize(redis)
    @redis = redis
  end

  def cached_radar_url(radar_code)
    radar_url = @redis.get("#{radar_code}_gif")
    unless radar_url
      radar_url = RadarGenerator.gif(radar_code)
      @redis.set("#{radar_code}_gif", radar_url, ex: CACHE_EXPIRY)
    end
    radar_url
  end

end
