do ($ = jQuery) ->

  class Flash

    defaults:
      msgs      : ['Success', 'Warning', 'Error', 'Notice', 'Alert']
      timeout   : 5000
      template  : (data) ->
        fn = -> 
          messages = for messageType, msg of @
            "<div class='alert alert-#{messageType}'>#{msg}</div>"
          messages.join ''
        fn.call(data)

    constructor: (el, settings) ->
      @$el = el
      {@msgs, @timeout, @template} = $.extend({}, @defaults, settings)

      @$el.delay(@timeout).slideUp('fast') unless @$el.is(':empty')

      $(document).ajaxComplete (e, xhr) =>
        headers = @flashHeaders(xhr)
        html = ''
        html = @template(headers) unless $.isEmptyObject(headers)

        @$el.html html
        @$el.stop(true, true).slideDown('fast')
          .delay(@timeout)
          .slideUp('fast')

    flashHeaders: (xhr) ->
      @msgs.reduce(
        (h, type) ->
          msg = xhr.getResponseHeader("X-Flash-#{type}")
          h[type.toLowerCase()] = msg if msg?
          h
        , {}
      )

  $.fn.xhrflash = (options) ->
    @each ->
      $this = $(@)
      data  = $this.data 'xhrflash'

      $this.data('xhrflash', new Flash($this, options)) unless data
