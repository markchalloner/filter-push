async = require 'async'

root = exports ? this

class root.Server

  constructor: (@before, @input, @filter, @output, @after, @error) ->

  start: (final) ->
    before = @before
    input  = @input
    filter = @filter
    output = @output
    after  = @after
    error  = @error
    async.waterfall([
      (callback) ->
        before.start.call(before, callback)
      ,
      (callback) ->
        input.start.call(input, callback)
      ,
      (mail, callback) ->
        filter.start.call(filter, mail, callback)
      ,
     (mail, callback) ->
        output.start.call(output, mail, callback)
    ], (err, result) ->
      if err
        error.start(err)
      else
        after.start(result)
    )
    (final ? (->))()

  stop: (final) ->
    before = @before
    input  = @input
    filter = @filter
    output = @output
    after  = @after
    error  = @error
    async.waterfall([
      (callback) ->
        after.stop.call(after, callback)
      ,
      (callback) ->
        output.stop.call(output, callback)
      ,
      (callback) ->
        filter.stop.call(filter, callback)
      ,
      (callback) ->
        input.stop.call(input, callback)
    ], (err, result) ->
      if err
        error.stop(err)
      else
        before.stop(result)
    )
    (final ? (->))()
