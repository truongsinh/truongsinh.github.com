var require = {
	paths: {
		'jquery': 'lib/jquery/jquery-1.8.3',
		'jquery/easytabs': 'lib/jquery/easytabs-3.1.1',
		'jquery/isotope': 'lib/jquery/isotope-1.5.21',
		'jquery/adipoli': 'lib/jquery/adipoli/adipoli-2.0.beta',
		'jquery/adipoli/style': 'lib/jquery/adipoli/adipoli-2.0.beta',
		'jquery/fancybox': 'lib/jquery/fancybox/fancybox-2.1.3',
		'jquery/fancybox/style': 'lib/jquery/fancybox/fancybox-2.1.3',
		'css': 'lib/require/css',
		'normalize': 'lib/require/normalize',
	},

	// Configure the dependencies and exports for older, traditional "browser globals" scripts that
	// do not use define() to declare the dependencies and set a module value.
	shim: {
		'jquery/easytabs': {
			deps: ['jquery'],
			exports: 'jQuery.fn.easytabs',
		},
		'jquery/isotope': {
			deps: ['jquery'],
			exports: 'jQuery.fn.isotope',
		},
		'jquery/adipoli': {
			deps: ['jquery', 'css!jquery/adipoli/style'],
			exports: 'jQuery.fn.adipoli',
		},
		'jquery/fancybox': {
			deps: ['jquery', 'css!jquery/fancybox/style'],
			exports: 'jQuery.fn.fancybox',
		},
		
	},

	// If set to true, an error will be thrown if a script loads that does not call define() or have
	// a shim exports string value that can be checked. See Catching load failures in IE for more
	// information.
	enforceDefine: true,
};
