define (require)->
	# ---------------------------------------------------------------------- 
	
	#	Custom Functions
	#	/* ---------------------------------------------------------------------- 
	$ = require 'jquery'
	
	require 'css!./style'
	require 'jquery/easytabs'
	require 'jquery/isotope'
	require 'jquery/adipoli'
	require 'jquery/fancybox'
	B = require 'backbone'
	# Needed variables
	$logo = $('#logo')
	
	# Show logo 
	$('.tab-resume,.tab-portfolio,.tab-contact').click ->
		$logo.fadeIn 'slow'

	
	# Hide logo
	$('.tab-profile').click ->
		$logo.fadeOut 'slow'

	
	# ---------------------------------------------------------------------- 
	
	#	Menu
	#	/* ---------------------------------------------------------------------- 
	
	# Needed variables
	$content = $('#content')
	
	# Run easytabs
	$content.easytabs
		animate: true
		updateHash: false
		transitionIn: 'slideDown'
		transitionOut: 'slideUp'
		animationSpeed: 600
		tabs: '.tmenu'
		tabActiveClass: 'active'

	
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
	
	#	Google Maps
	#	/* ---------------------------------------------------------------------- 
	
	# Needed variables
	$map = $('#map')
	$tabContactClass = ('tab-contact')
	$address = 'Level 13, 2 Elizabeth St, Melbourne Victoria 3000 Australia'
	$content.bind 'easytabs:after', (evt, tab, panel) ->
		console.log 'developing'


	
	# ---------------------------------------------------------------------- 
	
	#	Style switcher
	#	/* ---------------------------------------------------------------------- 
	$('.bg-switcher').click ->
		bgNumber = $(this).attr('value')
		$('body').css 'background-image', 'url(images/bg' + bgNumber + '.png)'
