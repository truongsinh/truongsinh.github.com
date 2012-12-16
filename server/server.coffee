connect = require 'connect'
path = require 'path'
staticDir = path.join __dirname, '..'
connect.createServer(connect.static staticDir).listen 8080
