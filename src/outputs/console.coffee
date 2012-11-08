{Output} = require '../output'

root = exports ? this

class root.ConsoleOutput extends Output

  start: (mail, after) ->
    console.log("Mail arrived from #{mail.from[0].name} with subject #{mail.subject}")
    after(null, mail)

  stop: (filter) ->
    filter(null)
