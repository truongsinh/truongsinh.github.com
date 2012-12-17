var require = {
	paths: {
		'jquery': 'lib/jquery/jquery-1.8.3',
		'jquery/easytabs': 'lib/jquery/easytabs-3.1.1',
		'jquery/isotope': 'lib/jquery/isotope-1.5.21',
		'jquery/adipoli': 'lib/jquery/adipoli/adipoli-2.0.beta',
		'jquery/adipoli/style': 'lib/jquery/adipoli/adipoli-2.0.beta',
		'jquery/fancybox': 'lib/jquery/fancybox/fancybox-2.1.3',
		'jquery/fancybox/style': 'lib/jquery/fancybox/fancybox-2.1.3',
		'backbone': 'lib/backbone-0.9.9',
		'underscore': 'lib/underscore-1.4.3',
		'css': 'lib/require/css',
		'css-builder': 'lib/require/css-builder',
		'normalize': 'lib/require/normalize',
		'linkedin': 'http://platform.linkedin.com/in.js?async=true',
		'dust': 'lib/dust-full-1.1.1',
		'rdust': 'lib/require/dust',
	},
	packages:[
		'page/profile',
	],
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
		'underscore': {
			exports: '_',
		},
		'backbone': {
			deps: ['jquery', 'underscore'],
			exports: 'Backbone',
		},
		'dust': {
			exports: 'dust',
		},
		'linkedin': {
			init: function(){
				IN.init({
					api_key: 'hop3ul32t7uv',
					authorize: true,
				});
			},
			exports: 'IN',
		}
	},

	// If set to true, an error will be thrown if a script loads that does not call define() or have
	// a shim exports string value that can be checked. See Catching load failures in IE for more
	// information.
	enforceDefine: true,
};
