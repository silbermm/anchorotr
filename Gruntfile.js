module.exports = function(grunt) {
	grunt
			.initConfig({
				pkg : grunt.file.readJSON('package.json'),
				uglify : {
					options : {
						banner : '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n',
						compress : {
							global_defs : {
								"DEBUG" : false
							},
							dead_code : true
						}
					},
					build : {
						files : {
							"src/main/webapp/WEB-INF/assets/js/common.js" : [
									'src/main/webapp/WEB-INF/assets/dev/angular/angular.js' ],
							}
					}
				},
				less : {
					development : {
						options : {
							paths : [
									"src/main/webapp/WEB-INF/assets/dev/less/",
									"src/main/webapp/WEB-INF/assets/dev/bootstrap/less/",
									"src/main/webapp/WEB-INF/assets/dev/font-awesome/less/" ]
						},
						files : {
							"src/main/webapp/WEB-INF/assets/dev/css/main.css" : "src/main/webapp/WEB-INF/assets/dev/less/main.less"
						}
					},	
				},
				cssmin: {
					combine: {
						files: {
					    	'src/main/webapp/WEB-INF/assets/css/main.css': ['src/main/webapp/WEB-INF/assets/dev/css/main.css', 
					    	                                                'src/main/webapp/WEB-INF/assets/dev/css/idm.css',
					    	                                                'src/main/webapp/WEB-INF/assets/dev/animate.css/animate.css'],
						}
					}
				},				
				watch : {
					scripts : {
						files : [ 
							'src/main/webapp/WEB-INF/assets/dev/js/*.js',							
							'src/main/webapp/WEB-INF/assets/dev/js/logs/*.js',	
							'src/main/webapp/WEB-INF/assets/dev/less/*.less' ],

						tasks : [ 'default' ],
						options : {
							spawn : false,
						},
					},
				}

			});

	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-less');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.registerTask('default', [ 'uglify', 'less', 'cssmin' ]);
};
