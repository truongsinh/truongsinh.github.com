connect = require 'connect'
path = require 'path'
connectAssets = require 'connect-assets'

staticDir = path.join __dirname, '..'
app = connect.createServer()
asset = {}

app.use connect.static staticDir
app.use (req, res, next)->
	if req.url.substr(0,5) is '/src/'
		if req.url.substr(-3) is '.js'
			asset.js req.url.substr(5)
		else if req.url.substr(-4) is '.css'
			asset.css req.url.substr(5)
	next()
app.use connectAssets
	src: path.join __dirname, '..'
	helperContext: asset
	buildDir: path.join __dirname, '../build-connect'
	build: true
asset.js.root = 'src'
asset.css.root = 'src'

app.listen 8080
