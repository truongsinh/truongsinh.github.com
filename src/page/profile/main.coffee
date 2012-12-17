define (require)->
	data = require 'data'
	# TODO: dust stills leaves HTML comments
	template = require 'rdust!./template'
	Base = require '../base'
	class View extends Base
		id: 'profile'
		model: data.profile
		template: template
