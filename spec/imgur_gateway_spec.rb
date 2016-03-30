require 'imgur_gateway'

describe ImgurGateway do

  describe '#upload' do

    let(:upload) { double('Imgur::Upload', link: 'http://imgur.com/link.gif') }

    let(:attributes) { { filename: 'raindar.gif', title: 'New weather radar'} }
    let(:imgur_gateway) { ImgurGateway.new(attributes) }

    before do
      allow(Imgur).to receive(:new) { double('Imgur', upload: upload) }
      allow(Imgur::LocalImage).to receive(:new) { double('Imgur::Image') }
    end

    context 'when given a filename and title' do

      it 'uploads to imgur' do
        expect(imgur_gateway.upload).to be_truthy
      end

      it 'sets the url' do
        imgur_gateway.upload
        expect(imgur_gateway.url).to eq(upload.link)
      end

    end

    context 'when no file is given' do

      let(:attributes) { { filename: nil, title: 'New BOM radar' } }

      it 'returns false' do
        expect(imgur_gateway.upload).to be_falsey
      end

      it 'leaves url as nil' do
        imgur_gateway.upload
        expect(imgur_gateway.url).to be_nil
      end

    end

    context 'when Imgur::LocalImage can not find the file' do

      let(:attributes) { { filename: 'garbage.gif', title: 'New BOM radar' } }

      before do
        allow(Imgur::LocalImage).to receive(:new) { raise Errno::ENOENT }
      end

      it 'returns false' do
        expect(imgur_gateway.upload).to be_falsey
      end

    end

    context 'when no title is given' do

      let(:attributes) { { filename: 'bomradar.gif', title: nil } }

      it 'uploads to imgur' do
        expect(imgur_gateway.upload).to be_truthy
      end

    end

    context 'when Imgur throws an error' do

      before do
        allow(Imgur).to receive(:new) { raise 'HELL' }
      end

      it 'returns false' do
        expect(imgur_gateway.upload).to be_falsey
      end

      it 'does not raise an error' do
        expect{ imgur_gateway.upload }.to_not raise_error
      end

    end

  end

end
