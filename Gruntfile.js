module.exports = function(grunt) {
  grunt.
    initConfig({
      pkg : grunt.file.readJSON('package.json'),
      html2js: {
        options: {
          rename : function (moduleName) {
            return  moduleName.replace('main/webapp/WEB-INF/resources/dev/js/', '');
          },
          htmlmin: { 
            collapseBooleanAttributes: true,
            collapseWhitespace: true,
            removeAttributeQuotes: true,
            removeComments: true,
            removeEmptyAttributes: true,
            removeRedundantAttributes: true,
            removeScriptTypeAttributes: true,
            removeStyleLinkTypeAttributes: true
          }
        },
        main: {
          src: ['src/main/webapp/WEB-INF/resources/dev/js/**/*.tpl.html'],
          dest: 'src/main/webapp/WEB-INF/resources/js/templates.js'
        },
      },
      concat: {
        basic_and_extras: {
          files: {
            "src/main/webapp/WEB-INF/resources/js/common.js" : [
              'src/main/webapp/WEB-INF/resources/dev/jquery/jquery.js',                        
              'src/main/webapp/WEB-INF/resources/dev/non-bower-js/masonry.js', 
              'src/main/webapp/WEB-INF/resources/dev/imagesloaded/imagesloaded.js',
              'src/main/webapp/WEB-INF/resources/dev/angular/angular.js',
              'src/main/webapp/WEB-INF/resources/dev/angular-growl/build/angular-growl.js',
              'src/main/webapp/WEB-INF/resources/dev/angular-masonry/angular-masonry.js',
              'src/main/webapp/WEB-INF/resources/dev/angular-ui-bootstrap-bower/ui-bootstrap-tpls.js',
              'src/main/webapp/WEB-INF/resources/dev/angular-ui-router/release/angular-ui-router.js',
              'src/main/webapp/WEB-INF/resources/dev/angulartics/dist/angulartics.min.js',
              'src/main/webapp/WEB-INF/resources/dev/angulartics/dist/angulartics-google-analytics.min.js',                                
              'src/main/webapp/WEB-INF/resources/dev/js/app.js',
              'src/main/webapp/WEB-INF/resources/dev/js/**/*.js',
            ],
          },
        },
      },
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
            "src/main/webapp/WEB-INF/resources/js/common.min.js" : [
              "src/main/webapp/WEB-INF/resources/js/common.js",
              "src/main/webapp/WEB-INF/resources/js/templates.js"
             ],
          }
        }
      },
      less : {
        development : {
          options : {
            paths : [
              "src/main/webapp/WEB-INF/resources/dev/less/",
              "src/main/webapp/WEB-INF/resources/dev/bootstrap/less/",
              "src/main/webapp/WEB-INF/resources/dev/font-awesome/less/"
            ]
          },
          files : {
            "src/main/webapp/WEB-INF/resources/dev/css/main.css" : "src/main/webapp/WEB-INF/resources/dev/less/main.less"
          }
        },
      },
      imagemin: {                         
        dynamic: {                         
	  files: [{
            expand: true, 
	      cwd: 'src/main/webapp/WEB-INF/resources/dev/img/',
	      src: ['**/*.{png,jpg,gif,ico}'],
	      dest: 'src/main/webapp/WEB-INF/resources/img/'
	   }]
    	}
      },
      cssmin: {
        combine: {
          files: {
            'src/main/webapp/WEB-INF/resources/css/main.css': [
              'src/main/webapp/WEB-INF/resources/dev/css/main.css',
              'src/main/webapp/WEB-INF/resources/dev/angular-growl/build/angular-growl.min.css'
            ],
          }
        }
      },
      watch : {
        scripts : {
          files : [ 
            'src/main/webapp/WEB-INF/resources/dev/js/*.js',							
            'src/main/webapp/WEB-INF/resources/dev/js/**/*.js',	
            'src/main/webapp/WEB-INF/resources/dev/js/**/*.tpl.html',
            'src/main/webapp/WEB-INF/resources/dev/less/*.less' 
           ],
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
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-html2js');	
    grunt.loadNpmTasks('grunt-contrib-imagemin');
    grunt.registerTask('default', [ 'html2js','concat','uglify', 'less', 'imagemin','cssmin' ]);
};
