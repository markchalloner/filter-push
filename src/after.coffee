{Plugin} = require './plugin'

root = exports ? this

class root.After extends Plugin
  
  stop: (output) ->
    super
