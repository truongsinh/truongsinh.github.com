//
var path
path = require('path');
// https://github.com/jrburke/r.js/blob/master/build/example.build.js
module.exports = {
	//The top level directory that contains your app. If this option is used
	//then it assumed your scripts are in a subdirectory under this path.
	//This option is not required. If it is not specified, then baseUrl
	//below is the anchor point for finding things. If this option is specified,
	//then all the files from the app directory will be copied to the dir:
	//output area, and baseUrl will assume to be a relative path under
	//this directory.

	//
	appDir : path.join(__dirname, '../src'),

	//By default, all modules are located relative to this path. If baseUrl
	//is not explicitly set, then all modules are loaded relative to
	//the directory that holds the build file. If appDir is set, then
	//baseUrl should be specified as relative to the appDir.
	//baseUrl: 'js',

	//By default all the configuration for optimization happens from the command
	//line or by properties in the config file, and configuration that was
	//passed to requirejs as part of the app's runtime "main" JS file is *not*
	//considered. However, if you prefer the "main" JS file configuration
	//to be read for the build so that you do not have to duplicate the values
	//in a separate configuration, set this property to the location of that
	//main JS file. The first requirejs({}), require({}), requirejs.config({}),
	//or require.config({}) call found in that file will be used.
	mainConfigFile: path.join(__dirname, '../src/config-require.js'),

	//The directory path to save the output. If not specified, then
	//the path will default to be a directory called "build" as a sibling
	//to the build file. All relative paths are relative to the build file.
	dir : path.join(__dirname, '../build-requirejs'),


	//How to optimize all the JS files in the build output directory.
	//Right now only the following values
	//are supported:
	//- "uglify": (default) uses UglifyJS to minify the code.
	//- "uglify2": in version 2.1.2+. Uses UglifyJS2.
	//- "closure": uses Google's Closure Compiler in simple optimization
	//mode to minify the code. Only available if running the optimizer using
	//Java.
	//- "closure.keepLines": Same as closure option, but keeps line returns
	//in the minified files.
	//- "none": no minification will be done.

	//Uncomment to turn off uglify minification.
	optimize: 'none',

	//Introduced in 2.1.2: If using "dir" for an output directory, normally the
	//optimize setting is used to optimize the build layers (the "modules"
	//section of the config) and any other JS file in the directory. However, if
	//the non-build layer JS files will not be loaded after a build, you can
	//skip the optimization of those files, to speed up builds. Set this value
	//to true if you want to skip optimizing those other non-build layer JS
	//files.
	skipDirOptimize: false,

	//Introduced in 2.1.1: If a full directory optimization ("dir" is used), and
	//optimize is not "none", and skipDirOptimize is false, then normally all JS
	//files in the directory will be minified, and this value is automatically
	//set to "all". For JS files to properly work after a minification, the
	//optimizer will parse for define() calls and insert any dependency arrays
	//that are missing. However, this can be a bit slow if there are many/larger
	//JS files. So this transport normalization is not done (automatically set
	//to "skip") if optimize is set to "none". Cases where you may want to
	//manually set this value:
	//1) Optimizing later: if you plan on minifying the non-build layer JS files
	//after the optimizer runs (so not as part of running the optimizer), then
	//you should explicitly this value to "all".
	//2) Optimizing, but not dynamically loading later: you want to do a full
	//project optimization, but do not plan on dynamically loading non-build
	//layer JS files later. In this case, the normalization just slows down
	//builds, so you can explicitly set this value to "skip".
	//Finally, all build layers (specified in the "modules" or "out" setting)
	//automatically get normalization, so this setting does not apply to those
	//files.
	normalizeDirDefines: "skip",
	
	//Allow CSS optimizations. Allowed values:
	//- "standard": @import inlining, comment removal and line returns.
	//Removing line returns may have problems in IE, depending on the type
	//of CSS.
	//- "standard.keepLines": like "standard" but keeps line returns.
	//- "none": skip CSS optimizations.
	//- "standard.keepComments": keeps the file comments, but removes line
	//returns.  (r.js 1.0.8+)
	//- "standard.keepComments.keepLines": keeps the file comments and line
	//returns. (r.js 1.0.8+)
	optimizeCss: "none",

	//Specify modules to stub out in the optimized file. The optimizer will
	//use the source version of these modules for dependency tracing and for
	//plugin use, but when writing the text into an optimized layer, these
	//modules will get the following text instead:
	//If the module is used as a plugin:
	//	define({load: function(id){throw new Error("Dynamic load not allowed: " + id);}});
	//If just a plain module:
	//	define({});
	//This is useful particularly for plugins that inline all their resources
	//and use the default module resolution behavior (do *not* implement the
	//normalize() method). In those cases, an AMD loader just needs to know
	//that the module has a definition. These small stubs can be used instead of
	//including the full source for a plugin.

	//Stub out the cs module after a build since
	//it will not be needed.
	stubModules : [
	],
	
	//If set to true, any files that were combined into a build layer will be
	//removed from the output folder.
	
	//Only avail when set 'out', not 'modules', i.e. 1 js for whole app, not js for each page
	removeCombined: true,
	
	//When the optimizer copies files from the source location to the
	//destination directory, it will skip directories and files that start
	//with a ".". If you want to copy .directories or certain .files, for
	//instance if you keep some packages in a .packages directory, or copy
	//over .htaccess files, you can set this to null. If you want to change
	//the exclusion rules, change it to a different regexp. If the regexp
	//matches, it means the directory will be excluded. This used to be
	//called dirExclusionRegExp before the 1.0.2 release.
	//As of 1.0.3, this value can also be a string that is converted to a
	//RegExp via new RegExp().
	//fileExclusionRegExp: /^(?!.*\.(js|coffee)$)[\/\w\.-]+$/,
	
	//By default, comments that have a license in them are preserved in the
	//output. However, for a larger built files there could be a lot of
	//comment files that may be better served by having a smaller comment
	//at the top of the file that points to the list of all the licenses.
	//This option will turn off the auto-preservation, but you will need
	//work out how best to surface the license information.
	preserveLicenseComments: false,

	//Sets the logging level. It is a number. If you want "silent" running,
	//set logLevel to 4. From the logger.js file:
	//TRACE: 0,
	//INFO: 1,
	//WARN: 2,
	//ERROR: 3,
	//SILENT: 4
	//Default for CLI is 0 and for node API is 4
	logLevel: 0,

	//Introduced in 2.1.3: Seed raw text contents for the listed module IDs.
	//These text contents will be used instead of doing a file IO call for
	//those modules. Useful is some module ID contents are dynamically
	//based on user input, which is common in web build tools.
	rawText: {
		// client config
		//'config': 'define(' + JSON.stringify(config.client) + ');',
	},
	
	name: 'main'
}
