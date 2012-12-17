define (require)->
	# ---------------------------------------------------------------------- 
	
	#	Custom Functions
	#	/* ---------------------------------------------------------------------- 
	$ = require 'jquery'
	
	require 'css!./style'
	require 'jquery/isotope'
	require 'jquery/adipoli'
	require 'jquery/fancybox'
	B = require 'backbone'
	page =
		profile: require 'page/profile/main'
		portfolio: require 'page/portfolio/main'
		resume: require 'page/resume/main'
		contact: require 'page/contact/main'
	# Needed variables
	$logo = $('#logo')
	
	### Show logo 
	$('.tab-resume,.tab-portfolio,.tab-contact').click ->
		$logo.fadeIn 'slow'

	
	# Hide logo
	$('.tab-profile').click ->
		$logo.fadeOut 'slow'
	###
	
	# ---------------------------------------------------------------------- 
	
	#	Menu
	#	/* ---------------------------------------------------------------------- 
	
	# Needed variables
	$content = $('#content')
	
	# Hover menu effect
	$content.find('.tabs li a').hover (->
		$(this).stop().animate
			marginTop: '-7px'
		, 200
	), ->
		$(this).stop().animate
			marginTop: '0px'
		, 300

	
	# ---------------------------------------------------------------------- 
	
	#	Portfolio
	#	/* ---------------------------------------------------------------------- 
	
	# Needed variables
	$container = $('#portfolio-list')
	$filter = $('#portfolio-filter')
	
	# Run Isotope	
	$container.isotope
		filter: '*'
		layoutMode: 'masonry'
		animationOptions:
			duration: 750
			easing: 'linear'

	
	# Isotope Filter 
	$filter.find('a').click ->
		selector = $(this).attr('data-filter')
		$container.isotope
			filter: selector
			animationOptions:
				duration: 750
				easing: 'linear'
				queue: false

		false

	
	# Portfolio image animation 
	$container.find('img').adipoli
		startEffect: 'transparent'
		hoverEffect: 'boxRandom'
		imageOpacity: 0.6
		animSpeed: 100

	
	# Copy categories to item classes
	$filter.find('a').click ->
		currentOption = $(this).attr('data-filter')
		$filter.find('a').removeClass 'current'
		$(this).addClass 'current'

	
	# ---------------------------------------------------------------------- 
	
	#	Fancybox 
	#	/* ---------------------------------------------------------------------- 
	$container.find('.folio').fancybox
		transitionIn: 'elastic'
		transitionOut: 'elastic'
		speedIn: 200
		speedOut: 200
		overlayOpacity: 0.6

	
	# ---------------------------------------------------------------------- 
	
	#	Contact Form
	#	/* ---------------------------------------------------------------------- 
	
	# Needed variables
	$contactform = $('#contactform')
	$success = 'Your message has been sent. Thank you!'
	$contactform.submit ->
		$.ajax
			type: 'POST'
			url: 'php/contact.php'
			data: $(this).serialize()
			success: (msg) ->
				if msg is 'SEND'
					response = '<div class=\'success\'>' + $success + '</div>'
				else
					response = '<div class=\'error\'>' + msg + '</div>'
				
				# Hide any previous response text
				$('.error,.success').remove()
				
				# Show response message
				$contactform.prepend response

		false


	
	# ---------------------------------------------------------------------- 
	
	#	Style switcher
	#	/* ---------------------------------------------------------------------- 
	$('.bg-switcher').click ->
		bgNumber = $(this).attr('value')
		$('body').css 'background-image', 'url(images/bg' + bgNumber + '.png)'

	Router = B.Router.extend
		# Backbone.js Routes
		routes:
			':page': 'changePage'
			':page/:subpage': 'changePage'
		pageMap:
			'profile': new page.profile().$el.appendTo($content)
			'portfolio': new page.portfolio().$el.appendTo($content)
			'resume': new page.resume().$el.appendTo($content)
			'contact': new page.contact().$el.appendTo($content)
		transitionDuration: 'normal'
		transitionPropertySet:
			height: 'toggle'
			padding: 'toggle'
		initialize: ->
			console.log @pageMap.profile[0]
			$('#content > div').animate @transitionPropertySet, 0, ()->
				$('body').show()
		changePage: (page,subpage)->
			page = 'profile' unless page of @pageMap
			show = =>
				@activePage = @pageMap[page]
				@activePage.animate @transitionPropertySet, @transitionDuration
			if @activePage
				@activePage.animate @transitionPropertySet, @transitionDuration, show
			else
				show()
	new Router()
	$ B.history.start()
