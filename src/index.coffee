EMAIL = require('config').email
prompt = require 'prompt'

{Server}              = require './server'
{ConsoleBefore}       = require './befores/console'
{IMAPInput}           = require './inputs/imap'
{SubjectRegExpFilter} = require './filters/subject-regexp'
{ConsoleOutput}       = require './outputs/console'
{ConsoleAfter}        = require './afters/console'
{ConsoleError}        = require './errors/console'

before = new ConsoleBefore('Running before.start()', 'Running before.stop()')
input  = new IMAPInput(EMAIL.username, EMAIL.password, EMAIL.host)
filter = new SubjectRegExpFilter('test')
output = new ConsoleOutput()
after  = new ConsoleAfter('Running after.start()', 'Running after.stop()')
error  = new ConsoleError()
server = new Server(before, input, filter, output, after, error)

console.log = ->

server.start(() ->
  prompt.message = ''
  prompt.delimiter = ''
  prompt.start()
  
  start = ->
    prompt.get([{
      name: 'command'
      description: '>'
    }], (err, result) ->
      if err
        console.log(err)
        return 1
      else
        switch result.command
          when 'exit'
            server.stop()
            console.log('Server stopped')
            return 0
          else
            console.log('Unrecognised command')
            start()
    )
  start()
)
