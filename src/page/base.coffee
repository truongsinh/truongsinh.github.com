define (require)->
	B = require 'backbone'
	class View extends Backbone.View
		initialize: (options)->
			super(options)
			@render()
		render: ->
			@template @model, (err, res)=>
				throw err if err
				@$el.html res
			@
