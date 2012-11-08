{Plugin} = require './plugin'

root = exports ? this

class root.Before extends Plugin
  
  start: (input) ->
    super
