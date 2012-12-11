# XHR-Flash

This gem is intended to simplify flash object presentation when an AJAX request was done.
Its work is very simple. Explained below:

1. Controller detects is an AJAX request is made
2. If flash object exists, then it's serialized into response attributes
3. Flash object is discarded
4. The client browser will be capable of render the message by mean of some javascript.

## Installation

Add this line to your application's Gemfile:

    gem 'xhr_flash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xhr_flash

## Usage

### Include xhr_flash javascript

Add the following to your app/assets/javascript/application.js

    //= require "jquery.xhrflash"

### Select the flash message container where you want to display them.

For example, if you want all messages to appear into a div with class messages, do this:

    $(function(){
      $('.messages').xhrflash();
    })
    ...
    <div class="messages"></div>

### Generated markup

XHR-Flash JQuery plugin, by default, renders the next html code:

    <div class="messages">
      <div class="alert alert-success">All went right</div>
      <div class="alert alert-error">Oops!, something was wrong</div>
    </div>

Yes, you can customize it a bit. You can pass the following parameters to xhrflash:

- msgs: It accepts a list of expected kind of messages to be displayed later. e.g.:

        $('.messages').xhrflash({msgs : ['Notice', 'Errors']}); // It only allow X-Flash-Notice and X-Flash-Errors to be displayed in the container.

- tag: Instead of divs, we can change the tag to wrap the messages.
- class: By default each message has alert and alert-... classes. It can be coustomized as well.
- timeout: Messages are visible for 5 seconds. You can specify another value here (in milliseconds).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
