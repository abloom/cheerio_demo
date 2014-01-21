assert  = require 'assert'
Tag = require '../src/tag'

describe 'write HTML', ->
  it 'creates a content tag', ->
    div = new Tag "div", {}, "content"
    assert.equal div.toString(), "<div>content</div>"

  it 'creates a tag', ->
    br = new Tag "br"
    assert.equal br.toString(), "<br>"

  it 'nests content tags', ->
    child = new Tag "p", {}, "content"
    parent = new Tag "div", {}, child
    assert.equal parent.toString(), "<div><p>content</p></div>"

  it 'accepts attrs', ->
    div = new Tag "div", class: 'title', "content"
    assert.equal div.toString(), '<div class="title">content</div>'
