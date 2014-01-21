cheerio = require 'cheerio'
request = require 'request'
assert  = require 'assert'
server  = require '../src/server'

describe 'read HTML', ->
  $ = csrf = app = undefined

  before (done) ->
    app = server.listen 3000, ->
      request.get 'http://localhost:3000/login', (err, res, body) ->
        assert.equal res.statusCode, 200

        $ = cheerio.load body
        done()

  after (done) ->
    app.close()
    done()

  it 'has content', ->
    assert $('body').length == 1

  it 'has a CSRF', ->
    csrf = $('input[name=csrf]').val()
    assert.equal csrf, "SECRET"

  describe 'and submitting', ->
    it 'without a csrf fails', (done) ->
      attrs = {}

      request.post 'http://localhost:3000/login', attrs, (err, res, body) ->
        assert.equal res.statusCode, 400
        done()

    it 'with a csrf succeeds', (done) ->
      attrs =
        form: {csrf}

      request.post 'http://localhost:3000/login', attrs, (err, res, body) ->
        assert.equal res.statusCode, 302
        done()
