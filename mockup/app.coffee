express = require "express"
sass = require "node-sass"
app = express()

app.get "/", (req, res)->
	res.redirect "/index.html"

app.configure ()->
	app.use express.methodOverride()
	app.use express.bodyParser()
	app.use app.router

	app.use sass.middleware
		src: __dirname
		dest: __dirname
		debug: true

	app.use express.static(__dirname + "/")

	app.use express.errorHandler
		dumpExceptions: true
		showStack: true

console.log "listening on port 3000"
app.listen 3000