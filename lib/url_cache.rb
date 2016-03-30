require 'redis'
require_relative "radar_generator"

class UrlCache
  REDIS = Redis.new(url: URI.parse(ENV["REDISTOGO_URL"] || "redis://127.0.0.1"))
  CACHE_EXPIRY = 300 # seconds

  def self.cached_radar_url(radar_code)
    radar_url = REDIS.get("#{radar_code}_gif")
    unless radar_url
      radar_url = RadarGenerator.gif(radar_code)
      REDIS.set("#{radar_code}_gif", radar_url, ex: CACHE_EXPIRY)
    end
    radar_url
  end

end
