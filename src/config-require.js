var require = {
	paths: {},

	// Configure the dependencies and exports for older, traditional "browser globals" scripts that
	// do not use define() to declare the dependencies and set a module value.
	shim: {},

	// If set to true, an error will be thrown if a script loads that does not call define() or have
	// a shim exports string value that can be checked. See Catching load failures in IE for more
	// information.
	enforceDefine: true,
};
