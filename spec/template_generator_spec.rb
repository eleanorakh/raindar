require 'radar_generator'

describe TemplateGenerator do

  describe '.template' do
    let(:radar_code) { "radar_code" }
    let(:template) { "template.png" }

    before do
      allow(TemplateGenerator).to receive(:system).with(anything) { true }
    end

    it 'generates a temporary template png file' do
      expect(TemplateGenerator.template(radar_code)).to be_a(Tempfile)
      expect(TemplateGenerator.template(radar_code).path).to end_with('.png')
      expect(TemplateGenerator.template(radar_code).path).to include('temp_named_template')
    end

    it 'calls imagemagick correctly' do
      expected_cmd = "convert -layers flatten "
      expected_cmd += "http://ws.cdn.bom.gov.au/products/radar_transparencies/radar_code.background.png "
      expected_cmd += "http://ws.cdn.bom.gov.au/products/radar_transparencies/radar_code.topography.png "
      expected_cmd += "http://ws.cdn.bom.gov.au/products/radar_transparencies/radar_code.range.png "
      expected_cmd += "http://ws.cdn.bom.gov.au/products/radar_transparencies/radar_code.locations.png"
      TemplateGenerator.template(radar_code)
      expect(TemplateGenerator).to have_received(:system).with(a_string_starting_with(expected_cmd))
    end

  end
end
