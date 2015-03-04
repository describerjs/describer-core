/**
 * Created by aotten77 on 31.03.2014.
 */
module.exports = function(grunt){

	var referenzfile = 'include/header.inc.asp';

	var getObjFor = function(path, searchpath){
		return {
			from: new RegExp("\'"+ path.replace(/\//g, '\\/') +"[^/\\n]*\'", "g"),
			// string replacement
			to: function(matchedWord, index, fullText, regexMatches){
				var _filename = '';
				var _searchpath = searchpath || '';
				grunt.file.recurse(_searchpath+path, callback);
				function callback(abspath, rootdir, subdir, filename) {
					var str = filename;
					var patt = new RegExp('^'+matchedWord.replace(/\'/g, "").replace(path, "")+'\\.(.*)');
					var res = patt.test(str);
					if(res && (subdir == undefined)){
						str = str.substring(0, str.length - ((str.substr(str.length - 3) === '.js') ? 3 : 4));
						_filename = str;
					}
				}
				if(_filename === ''){
					return "\'empty\'";
				}else{
					return "\'"+ path + _filename +"\'";
				}
			}
		};
	};
	// here we want to preserver the BOM of the layout file, otherwise all of the umlauts will die
	grunt.file.defaultEncoding = 'utf8';
	grunt.file.preserveBOM = true;

	// These plugins provide necessary tasks.
	grunt.loadNpmTasks('grunt-asset-revisions');
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-contrib-cssmin');

	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-text-replace');
	grunt.loadNpmTasks('grunt-imageoptim');
	//grunt.loadNpmTasks('grunt-sass');
	//grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	/*	grunt.loadNpmTasks('grunt-contrib-nodeunit');
	grunt.loadNpmTasks('grunt-contrib-watch');*/
	/*grunt.loadNpmTasks("grunt-remove-logging");
	grunt.loadNpmTasks('grunt-dalek');
	grunt.loadNpmTasks('grunt-imageoptim');
	grunt.loadNpmTasks('grunt-webp');*/

	grunt.registerTask('task_step1', function(){
		grunt.initConfig({
			clean: {
				clean: ["css/build/", "js/build/"]
			},
			uglify: {
				build : {
					src     : ['**/*.js', '!*.min.js', '!**/main.js'],
					cwd     : 'js/',
					dest    : 'js/build/',
					expand  : true
				}
			},
			replace: {
				example: {
					src: ['js/build/**/*.js'],
					overwrite: true,                 // overwrite matched source files
					replacements: [{
						from: /^define(.*?)function/,          // string replacement
						to: function(matchedWord, index, fullText, regexMatches){
							var match;
							var _return;
							try{
								match = /a.plugin\("(.*?)"/i.exec(fullText)[1];
								match = match.replace(/\./g, '_');
								_return = matchedWord + ' __MOD__' + match;
							}catch(e){
								_return = matchedWord;
							}
							return _return;
						}
					}]
				}
			},
			copy: {
				main: {
					src: ['**/*.js', '!*.min.js', '!**/main.js'],
					cwd: 'js/',
					dest: 'js/build/',
					expand  : true
				}
			},
			cssmin: {
				compress: {
					files: {
						'css/build/style.css': ['css/style.css'],
						'css/build/noscript.css': ['css/noscript.css'],
						'js/build/require-css/video.css': ['js/require-css/video.css']
					}
				}
			},
			revisions: {
				rename: {
					src: ['js/build/**', 'css/build/**'],
					dest: ''
				}
			}
		});
	});

	grunt.registerTask('task_step2', function(){
		grunt.initConfig({
			replace: {
				example: {
					src: ['js/describer-config/main.js'],             // source files array (supports minimatch)
					dest: 'js/build/describer-config/main.js',             // destination directory or file
					replacements: [
						{
							from: 'main',
							// string replacement
							to: function(matchedWord, index, fullText, regexMatches){
								var _filename = '';
								grunt.file.recurse('js/build/describer-config/', callback);
								function callback(abspath, rootdir, subdir, filename) {
									var str = filename;
									var patt = new RegExp('^'+matchedWord.replace(/\'/g, "")+'\\.(.*)');
									var res = patt.test(str);
									if(res && (subdir == undefined)){
										str = str.substring(0, str.length - ((str.substr(str.length - 3) === '.js') ? 3 : 4));
										_filename = str;
									}
								}
								return _filename;
							}
						},

						// describer-config
						getObjFor('describer-config/', 'js/build/'),
						getObjFor('describer-config/nls/', 'js/build/'),
						getObjFor('describer-config/nls/en/', 'js/build/'),

						// describer-core
						getObjFor('describer-core/', 'js/build/'),
						getObjFor('describer-core/actions/', 'js/build/'),
						getObjFor('describer-core/libs/', 'js/build/'),

						// describer-localStorage
						getObjFor('describer-localStorage/', 'js/build/'),

						// describer-more
						getObjFor('describer-more/modules/', 'js/build/'),
						getObjFor('describer-more/modules/form/', 'js/build/'),
						getObjFor('describer-more/plugins/', 'js/build/'),
						getObjFor('describer-more/plugins/customized/', 'js/build/'),
						getObjFor('describer-more/plugins/overwritings/', 'js/build/'),
						getObjFor('describer-more/require-css/', 'js/build/')
					]
				}
			}
		});
	});
	// Project configuration.
	grunt.registerTask('task_step3', function(){
		grunt.initConfig({
			uglify: {
				build : {
					src     : ['js/build/describer-config/main.js'],
					expand  : true
				}
			},
			revisions: {
				rename: {
					src: 'js/build/describer-config/main.js',
					dest: ''
				}
			}
		});
	});

	grunt.registerTask('task_step4', function(){
		grunt.initConfig({
			replace: {
				example: {
					src: [referenzfile],             // source files array (supports minimatch)
					dest: referenzfile,             // destination directory or file
					replacements: [{
						from: /css\/build\/style(.*?)\.css/g,          // string replacement
						to: function(matchedWord, index, fullText, regexMatches){
							var _filename = '';
							grunt.file.recurse('css/build', callback);
							function callback(abspath, rootdir, subdir, filename) {
								var str = filename;
								var patt = new RegExp(/^style.(.*)/g);
								var res = patt.test(str);
								if(res){
									grunt.log.write('res: '+_filename);
									_filename = str;
								}

							}
							return "css/build/" + _filename;
						}
					},
						{
							from: /css\/build\/noscript(.*?)\.css/g,          // string replacement
							to: function(matchedWord, index, fullText, regexMatches){
								var _filename = '';
								grunt.file.recurse('css/build', callback);
								function callback(abspath, rootdir, subdir, filename) {
									var str = filename;
									var patt = new RegExp(/^noscript.(.*)/g);
									var res = patt.test(str);
									if(res){
										grunt.log.write('res: '+_filename);
										_filename = str;
									}

								}
								return "css/build/" + _filename;
							}
						},
						{
							from: /js\/build\/describer-localStorage\/localStorage(.*?)\.js/g,                   // string replacement
							to: function(matchedWord, index, fullText, regexMatches){
								var _filename = '';
								grunt.file.recurse('js/build/describer-localStorage/', callback);
								function callback(abspath, rootdir, subdir, filename) {
									var str = filename;
									var patt = new RegExp(/^localStorage.(.*)/g);
									var res = patt.test(str);
									if(res){
										//grunt.log.write('res: '+_filename);
										_filename = str;
									}

								}
								return "js/build/describer-localStorage/"+ _filename;
							}
						},
						{
							from: /js\/build\/describer-localStorage\/require.2.1.11-localStorage(.*?)\.js/g,                   // string replacement
							to: function(matchedWord, index, fullText, regexMatches){
								var _filename = '';
								grunt.file.recurse('js/build/describer-localStorage/', callback);
								function callback(abspath, rootdir, subdir, filename) {
									var str = filename;
									var patt = new RegExp(/^require.2.1.11-localStorage.(.*)/g);
									var res = patt.test(str);
									if(res){
										//grunt.log.write('res: '+_filename);
										_filename = str;
									}

								}
								return "js/build/describer-localStorage/"+ _filename;
							}
						},
						{
							from: /js\/build\/describer-core\/libs\/modernizr.custom(.*?)\.js/g,                   // string replacement
							to: function (matchedWord, index, fullText, regexMatches) {
								var _filename = '';
								grunt.file.recurse('js/build/describer-core/libs', callback);
								function callback(abspath, rootdir, subdir, filename) {
									var str = filename;
									var patt = new RegExp(/^modernizr.custom.(.*)/g);
									var res = patt.test(str);
									if (res) {
										//grunt.log.write('res: '+_filename);
										_filename = str;
									}

								}
								return "js/build/describer-core/libs/" + _filename;
							}
						},
						{
							from: /js\/build\/describer-core\/libs\/matchmedia(.*?)\.js/g,                   // string replacement
							to: function (matchedWord, index, fullText, regexMatches) {
								var _filename = '';
								grunt.file.recurse('js/build/describer-core/libs', callback);
								function callback(abspath, rootdir, subdir, filename) {
									var str = filename;
									var patt = new RegExp(/^matchmedia.(.*)/g);
									var res = patt.test(str);
									if (res) {
										//grunt.log.write('res: '+_filename);
										_filename = str;
									}

								}
								return "js/build/describer-core/libs/" + _filename;
							}
						},
						{
							from: /js\/build\/describer-more\/plugins\/picturefill(.*?)\.js/g,                   // string replacement
							to: function (matchedWord, index, fullText, regexMatches) {
								var _filename = '';
								grunt.file.recurse('js/build/describer-more/plugins', callback);
								function callback(abspath, rootdir, subdir, filename) {
									var str = filename;
									var patt = new RegExp(/^picturefill.(.*)/g);
									var res = patt.test(str);
									if (res) {
										//grunt.log.write('res: '+_filename);
										_filename = str;
									}

								}
								return "js/build/describer-more/plugins/" + _filename;
							}
						},
						{
							from: /\/js\/build\/describer-config\/main(.*)\'/g,                   // string replacement
							to: function(matchedWord, index, fullText, regexMatches){
								var _filename = '';
								grunt.file.recurse('js/build/describer-config', callback);
								function callback(abspath, rootdir, subdir, filename) {
									var str = filename;
									var patt = new RegExp(/^main.(.*)/g);
									var res = patt.test(str);
									if(res){
										//grunt.log.write('res: '+_filename);
										_filename = str;
									}

								}
								return "/js/build/describer-config/"+ _filename + "'";
							}
						}]
				}
			}
		});
	});

	// Project configuration.
	grunt.registerTask('task_step5', function(){
		grunt.initConfig({
			imageoptim: {
				imgcomp: {
					options: {
						jpegMini: true,
						imageAlpha: false,
						quitAfter: false
					},
					src: ['/img/image-teaser-apps-747-119-X2.jpg']
				}
			}
		});
	});

	grunt.registerTask('task_step6', function(){
		grunt.initConfig({
			// WebP configuration
			webp: {
				files: {
					expand: true,
					//cwd: 'path/to/source/images',
					/*					src: ['img/add-on-steps/add-on-steps-1.png'],
										dest: '/'*/
					src: ['**/*.jpg', '**/*.png', '!**/productimages/*.png'] ,
					cwd: 'img/',
					dest: 'img/'
				},
				options: {
					binpath: require('webp-bin').path,
					preset: 'photo',
					verbose: true,
					quality: 80,
					alphaQuality: 80,
					compressionMethod: 6,
					segments: 4,
					psnr: 50,
					sns: 50,
					filterStrength: 40,
					filterSharpness: 3,
					simpleFilter: true,
					partitionLimit: 50,
					analysisPass: 6,
					multiThreading: true,
					lowMemory: false,
					alphaMethod: 0,
					alphaFilter: 'best',
					alphaCleanup: true,
					noAlpha: false,
					lossless: false
				}
			}

		});

	});

	/*grunt.registerTask('libsass-task', function(){
		grunt.initConfig({
			sass: {
				develop: {
					*//*options: {
						sourceMap: true
					},*//*
					files: {
						'css/mystyle.css': 'scss/style.scss'
					}
				}
			}
		});

	});*/

	/*grunt.registerTask('sass-task', function(){
		grunt.initConfig({
			sass: {                              // Task
				dist: {                            // Target
					options: {                       // Target options
						style: 'expanded'
					},
					files: {                         // Dictionary of files
						'css/mystyle.css': 'scss/style.scss'*//*,       // 'destination': 'source'
						'widgets.css': 'widgets.scss'*//*
					}
				}
			}
		});
	});*/

	grunt.registerTask('compass-task', function(){
		grunt.initConfig({
			compass: {                  // Task
				dev: {                    // Another target
					options: {
						sassDir: 'scss',
						cssDir: 'css'
					}
				}
			}
		});
	});

	grunt.registerTask('watch-task', function(){
		grunt.initConfig({
			watch: {
				css: {
					files: '**/*.scss',
					tasks: ['compass-task', 'compass']
				}
			}
		});
	});





	grunt.registerTask('default1', ['task_step1', 'clean', 'uglify', 'replace', 'cssmin', 'revisions' ]);
	grunt.registerTask('default2', ['task_step2', 'replace' ]);
	grunt.registerTask('default3', ['task_step3', 'uglify', 'revisions' ]);
	grunt.registerTask('default4', ['task_step4', 'replace' ]);
	grunt.registerTask('default5', ['task_step5', 'imageoptim' ]);
	grunt.registerTask('default6', ['task_step6', 'webp' ]);
	//grunt.registerTask('defaultlibsass', ['libsass-task', 'sass']);
	grunt.registerTask('watchscss', ['watch-task', 'watch']);
	//grunt.registerTask('compass', ['compass-task', 'compass']);


	//grunt.registerTask('ErstelleMainJSMitVersioniertenJSVerweisen', ['createMainJS', 'replace']);
	grunt.registerTask('default', ['default1', 'default2', 'default3', 'default4']);
};