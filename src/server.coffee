express = require 'express'
app = express()
app.use express.static "#{__dirname}/../public"
app.use express.bodyParser()

app.post "/login", (req, res) ->
  {csrf} = req.body

  if csrf == "SECRET"
    res.redirect "/"
  else
    res.send 400

module.exports = app
