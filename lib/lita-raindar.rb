require "lita"
require_relative "url_cache"

module Lita
  module Handlers
    class Raindar < Handler
      config :imgur_api_key

      route(/^weather ([a-zA-Z0-9\s]*)$/i, :radar, command: true, help: { "weather LOCATION" => "Returns GIF of recent weather radar" })
      route(/^(radar locations)$/i, :radar_locations, command: true, help: { "radar locations" => "Returns list of available radar locations" })

      RADARS = {
        "melbourne" => "IDR023",
        "bairnsdale" => "IDR683",
        "mildura" => "IDR303",
        "yarrawonga" => "IDR493",
        "canberra" => "IDR403",
        "sydney" => "IDR713",
        "grafton" => "IDR283",
        "newcastle" => "IDR043",
        "moree" => "IDR533",
        "namoi" => "IDR693",
        "wagga wagga" => "IDR553",
        "wollongong" => "IDR033",
        "brisbane" => "IDR663",
        "bowen" => "IDR243",
        "cairns" => "IDR193",
        "emerald" => "IDR723",
        "gladstone" => "IDR233",
        "gulf of carpentaria" => "IDR363",
        "gympie" => "IDR083",
        "longreach" => "IDR563",
        "mackay" => "IDR223",
        "mount isa" => "IDR753",
        "townsville" => "IDR733",
        "warrego" => "IDR673",
        "weipa" => "IDR783",
        "willis island" => "IDR413",
        "perth" => "IDR703",
        "albany" => "IDR313",
        "broome" => "IDR173",
        "carnarvon" => "IDR053",
        "dampier" => "IDR153",
        "esperance" => "IDR323",
        "geraldton" => "IDR063",
        "giles" => "IDR443",
        "halls creek" => "IDR393",
        "kalgoorlie" => "IDR483",
        "learmonth" => "IDR293",
        "port headland" => "IDR163",
        "wyndham" => "IDR073",
        "hobart" => "IDR763",
        "west takone" => "IDR523",
        "adelaide" => "IDR643",
        "ceduna" => "IDR333",
        "mt gambier" => "IDR143",
        "woomera" => "IDR273",
        "darwin" => "IDR633",
        "alice springs" => "IDR253",
        "gove" => "IDR093",
        "katherine" => "IDR423",
        "warruwi" => "IDR773",
      }

      def radar(response)
        requested_location = response.match_data[1].to_s
        code = RADARS[requested_location.downcase]

        if code.nil?
          response.reply("Location not currently available")
        else
          response.reply(url_cache.cached_radar_url(code))
        end

      end

      def radar_locations(response)
        response.reply(radar_list)
      end

      private

      def url_cache
        UrlCache.new(redis)
      end

      def radar_list
        list = """
          Adelaide
          Albany
          Alice Springs
          Bairnsdale
          Bowen
          Brisbane
          Broome
          Cairns
          Canberra
          Carnarvon
          Ceduna
          Dampier
          Darwin
          Emerald
          Esperance
          Geraldton
          Giles
          Gladstone
          Gove
          Grafton
          Gulf of Carpentaria
          Gympie
          Halls Creek
          Hobart
          Kalgoorlie
          Katherine
          Learmonth
          Longreach
          Mackay
          Melbourne
          Mildura
          Moree
          Mount Isa
          Mt Gambier
          Namoi
          Newcastle
          Perth
          Port Headland
          Sydney
          Townsville
          Wagga Wagga
          Warrego
          Warruwi
          Weipa
          West Takone
          Willis Island
          Wollongong
          Woomera
          Wyndham
          Yarrawonga
        """
      end

      Lita.register_handler(self)

    end
  end
end
