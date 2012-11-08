notifier = require 'mail-notifier'
{Input} = require '../input'

root = exports ? this

class root.IMAPInput extends Input
  
  constructor: (@username, @password, @host, @port = 993, @secure = true) ->

  start: (filter) ->
    imap =
      username: @username
      password: @password
      host:     @host
      port:     @port
      secure:   @secure
    @event = notifier(imap).on('mail', (mail) ->
      filter(null, mail)
    )
    @event.start()

  stop: (before) ->
    @event.stop()
    before(null)
