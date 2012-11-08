{Filter} = require '../filter'

root = exports ? this

class root.SubjectRegExpFilter extends Filter
  
  constructor: (@pattern) ->

  start: (mail, output) ->
    output(null, mail) if mail.subject.match(new RegExp(@pattern))

  stop: (input) ->
    input(null)
