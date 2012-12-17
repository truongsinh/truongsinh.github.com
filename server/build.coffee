requirejs = require 'requirejs'
config = require './requirejs-build-config'
fs = require 'fs'
less = require 'less'

tempFileSet = []

options =
	optimization: 1
	silent: false
	paths: [ '/Users/truongsinh/Development/vcard/src' ]
	color: true
	compress: false
filename = '/Users/truongsinh/Development/vcard/src/style.'
source = fs.readFileSync(filename + 'less', 'utf8')
###
less.Parser(options).parse source, (err, tree) ->
	throw err if err
	result = tree.toCSS options
	writeFileName = filename + 'css'
	fs.writeFileSync writeFileName, result
	tempFileSet.push writeFileName
###
requirejs.optimize config