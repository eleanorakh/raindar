# Raindar

This gem is a plugin for Lita, a customisable chatbot. To install Lita in your chat room, visit [Lita](https://www.lita.io/).
Raindar is specific to Australia - the chatbot responds to a users request of 'weather LOCATION' with a GIF of the most recent radar from the Bureau of Meteorology. It is responsive to all locations in Australia that have a radar listed on the BOM website.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'raindar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install raindar

## Configuration

In `lita_config.rb`, it is necessary to set an `imgur_api_key`:

    $ config.handlers.raindar.imgur_api_key = ENV["IMGUR_API_KEY"]

## Usage

Once the gem is installed and `imgur_api_key` set, the commands are as follows. Note that `lita` is used as an example. This will be your specific robot name

```
lita weather LOCATION
```

Locations are:

```
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
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eleanorakh/raindar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

# raindar
