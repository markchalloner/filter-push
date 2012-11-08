{Before} = require '../before'

root = exports ? this

class root.ConsoleBefore extends Before
  
  constructor: (@start_message, @stop_message) ->

  start: (input) ->
    console.log(@start_message)
    input(null)
    super

  stop: () ->
    console.log(@stop_message)
    super
