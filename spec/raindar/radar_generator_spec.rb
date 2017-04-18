require 'raindar/radar_generator'

describe Raindar::RadarGenerator do
  describe '.gif' do

    let(:radar_code) { "radar_code" }
    let(:mock_gateway) { instance_double(Raindar::ImgurGateway, upload: true, url: 'http://_some_link_') }
    let(:json_data) {
<<EOF
 {
   "image_files": {
     "0": "image_1.png",
     "1": "image_2.png"
   }
 }
EOF
    }

    before do

      allow(Net::HTTP).to receive(:get).
        with(URI('http://m.bom.gov.au/radar/radar_code.T.filenames.json')).
        and_return(json_data)

      allow(Raindar::RadarGenerator).to receive(:system).with(anything) { true }

      allow(Raindar::ImgurGateway).to receive(:new).and_return(mock_gateway)

    end

    it 'returns a imgur URL to the generated gif' do
      expect(Raindar::RadarGenerator.gif(radar_code)).to eq 'http://_some_link_'
    end

  end

end
