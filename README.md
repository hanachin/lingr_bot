# LingrBot

A Ruby wrapper for the Lingr Bot API

## Installation

Add this line to your application's Gemfile:

    gem 'lingr_bot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lingr_bot

## Usage
visit [Lingr Developer Center](http://lingr.com/developer) and create a new bot.

``` ruby
require 'lingr_bot'

# 1.
lingr_bot = LingrBot.new(id: 'your_bot_id', 'your_bot_secret')
lingr_bot.say('room_id', 'message')

# 2.
LingrBot.configure do |config|
  config.id     = 'your_bot_id'
  config.secret = 'your_bot_secret'
end

LingrBot.say('room_id', 'message')

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
