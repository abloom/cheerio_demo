cheerio = require 'cheerio'

class Tag
  constructor: (@type, opts = {}, content) ->
    @$ = cheerio.load("<#{@type}>")
    el = @$(@type)

    for name, value of opts
      el.attr name, value

    el.html content if content

  toString: ->
    @$.html()

module.exports = Tag
