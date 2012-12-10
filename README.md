# XHR-Flash

This gem is intended to simplify flash object presentation when an AJAX request was done.
Its work is very simple. Explained below:

1.- Controller detects is an AJAX request is made
2.- If flash object exists, then it's serialized into response attributes
3.- Flash object is discarded
4.- The client browser will be capable of render the message by mean of some javascript.

## Installation

Add this line to your application's Gemfile:

    gem 'xhr_flash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xhr_flash

## Usage

Not defined yet

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
