$ = jQuery

class Flash

  constructor: (object, settings) ->
    # Set timeout to hide current alerts if any
    @msgArea    = object
    @msgList    = settings.msgs
    @tag        = settings.tag
    @class      = settings.class
    @timeout    = settings.timeout
    @bootstrap  = settings.bootstrap

    @slideUpTimer() if @msgArea.find('.alert').length > 0

    $(document).ajaxComplete (e, xhr) =>
      # Removes previous messages
      headers = @flashHeaders(xhr)

      @msgArea.hide().empty()
      return if $.isEmptyObject(headers)

      @msgArea.append(@messageTag(type, msg)) for type, msg of headers
      @msgArea.slideDown('fast', @slideUpTimer)

  messageTag: (type, msg) ->
    type = if @bootstrap then @bootstrapType(type) else type
    close_btn = if @bootstrap then '<button type="button" class="close" data-dismiss="alert">&times;</button>' else ''
    "<#{@tag} class=\"#{@class} #{@class}-#{type.toLowerCase()}\">#{close_btn}#{msg}</#{@tag}>"

  bootstrapType: (type) ->
    switch type.toLowerCase()
      when 'notice', 'success' then 'success'
      when 'error' then 'error'
      when 'alert', 'warning' then 'warning'
      else type

  flashHeaders: (xhr) ->
    @msgList.reduce(
      (h, type) ->
        msg = xhr.getResponseHeader("X-Flash-#{type}")
        h[type.toLowerCase()] = msg if msg?
        h
      , {}
    )

  slideUpTimer: =>
    clearTimeout(@_timer) if @_timer?
    @_timer = setTimeout(
      =>
        @msgArea.slideUp()
      , @timeout
    )

$.fn.xhrflash = (options) ->
  $container = @

  settings =
    msgs      : ['Success', 'Warning', 'Error', 'Notice', 'Alert']
    tag       : 'div'
    class     : 'alert'
    timeout   : 5000
    bootstrap : false

  settings = $.extend settings, options

  @each ->
    $this = $(@)
    data  = $this.data 'xhrflash'

    unless data
      # Logic
      new Flash($this, settings)

      $this.data 'xhrflash', true
