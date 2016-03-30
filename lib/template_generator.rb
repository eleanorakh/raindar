require 'tempfile'

class TemplateGenerator

  def self.template(radar_code)
    temporary_template = Tempfile.new(['temp_named_template', '.png'])

    system "convert -layers flatten #{background(radar_code)} #{topography(radar_code)} #{range(radar_code)} #{locations(radar_code)} #{temporary_template.path}"

    temporary_template.path

  end

  private

  def self.template_url(radar_code)
    "http://ws.cdn.bom.gov.au/products/radar_transparencies/#{radar_code}"
  end

  def self.background(radar_code)
    "#{template_url(radar_code)}.background.png"
  end

  def self.topography(radar_code)
    "#{template_url(radar_code)}.topography.png"
  end

  def self.range(radar_code)
    "#{template_url(radar_code)}.range.png"
  end

  def self.locations(radar_code)
    "#{template_url(radar_code)}.locations.png"
  end

end
