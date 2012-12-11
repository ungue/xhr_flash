$ = jQuery

class Flash
  
  constructor: (object, settings) ->
    # Set timeout to hide current alerts if any
    @msgArea  = object
    @msgList  = settings.msgs
    @tag      = settings.tag
    @class    = settings.class
    @timeout  = settings.timeout

    @slideUpTimer() if @msgArea.find('.alert').length > 0

    object.ajaxComplete (e, xhr) =>
      # Removes previous messages
      headers = @flashHeaders(xhr)
      
      @msgArea.hide().empty()
      return if $.isEmptyObject(headers)

      @msgArea.append(@messageTag(type, msg)) for type, msg of headers
      @msgArea.slideDown('fast', @slideUpTimer)

  messageTag: (type, msg) -> 
    "<#{@tag} class=\"#{@class} #{@class}-#{type.toLowerCase()}\">#{msg}</#{@tag}>"

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
    msgs    : ['Success', 'Warning', 'Error', 'Notice']
    tag     : 'div'
    class   : 'alert'
    timeout : 5000

  settings = $.extend settings, options

  @each ->
    $this = $(@)
    data  = $this.data 'xhrflash'

    unless data
      # Logic
      new Flash($this, settings)

      $this.data 'xhrflash', true
