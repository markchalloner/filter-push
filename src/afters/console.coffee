{After} = require '../after'

root = exports ? this

class root.ConsoleAfter extends After
  
  constructor: (@start_message, @stop_message) ->

  start: () ->
    console.log(@start_message)
    super

  stop: (output) ->
    console.log(@stop_message)
    output(null)
    super
