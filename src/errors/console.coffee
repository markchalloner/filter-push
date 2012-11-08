{Error} = require '../error'

root = exports ? this

class root.ConsoleError extends Error
  
  start: (err) ->
    console.log(err)

  stop: (err) ->
    console.log(err)
