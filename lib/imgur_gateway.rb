require 'imgur'

class ImgurGateway

  attr_accessor :filename, :title, :url

  def initialize(filename: nil, title: nil)
    @filename = filename
    @title = title || image_title
  end

  def upload
    return false unless filename
    client = Imgur.new(imgur_api_key)
    image = Imgur::LocalImage.new(filename, title: title)
    uploaded = client.upload(image)
    @url = uploaded.link
  rescue
    return false
  end

  private

  def image_title
    "Raindar #{Time.now.strftime('%A, %B %d, %Y')}"
  end

  def imgur_api_key
    Lita.config.handlers.raindar.imgur_api_key
  end

end
