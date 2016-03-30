require 'imgur'

class ImgurGateway
  IMGUR_API_KEY = ENV['IMGUR_API_KEY']

  attr_accessor :filename, :title, :url

  def initialize(filename: nil, title: nil)
    @filename = filename
    @title = title || image_title
  end

  def upload
    return false unless filename
    client = Imgur.new(IMGUR_API_KEY)
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

end
