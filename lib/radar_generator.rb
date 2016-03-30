require 'httparty'
require_relative 'imgur_gateway'
require 'json'
require 'tempfile'
require_relative 'template_generator'

class RadarGenerator
  IMGUR_API_KEY = ENV['IMGUR_API_KEY']

  def self.gif(radar_code)
    template = TemplateGenerator.template(radar_code)

    temporary_image_files = recent_image_filenames(radar_code).map do |radar_image|
      tempfile = Tempfile.new('composed')

      system "convert -layers flatten #{template} #{raindar_url_for(radar_image)} #{tempfile.path}"
      tempfile
    end
    composed_file_paths = temporary_image_files.map { |tempfile|
      tempfile.path
    }.join(' ')

    temporary_radar_gif = Tempfile.new(['radar', '.gif'])
    system "convert -delay 50 -loop 0 #{composed_file_paths} #{temporary_radar_gif.path}"
    temporary_image_files.each(&:unlink)

    imgur_gateway = ImgurGateway.new(filename: temporary_radar_gif.path)
    if imgur_gateway.upload
      temporary_radar_gif.unlink
      imgur_gateway.url
    else
      'http://bit.ly/1OrtWKX'
    end
  end

  private

  def self.raindar_url
    "http://m.bom.gov.au/radar/"
  end

  def self.raindar_image_json_url(radar_code)
    "#{raindar_url}#{radar_code}.T.filenames.json"
  end

  def self.raindar_url_for(radar_image)
    raindar_url + radar_image
  end

  def self.most_recent_radar_image_json(radar_code)
    HTTParty.get(raindar_image_json_url(radar_code)).response.body
  end

  def self.recent_image_filenames(radar_code)
    JSON.parse(most_recent_radar_image_json(radar_code))["image_files"].values
  end

end
