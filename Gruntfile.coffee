module.exports = (grunt) ->

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),

		concat: {
			index: {
			
				options: {
					separator: ';'
				}

				#files to concatenate
				src: [
					"bower_components/angular/angular.js"
					"bower_components/angular-route/angular-route.js"
					"bower_components/angular-sanitize/angular-sanitize.js"
					"bower_components/angular-animate/angular-animate.js"
					"bower_components/contentful/dist/contentful.js"
					"bower_components/ng-contentful/ng-contentful.js"
					"bower_components/handlebars/handlebars.js"
					"bower_components/angular-scroll/angular-scroll.js"
					"bower_components/showdown/compressed/showdown.js"
					"js/app.js"
					"js/controllers.js"
					"js/directives.js"
					"js/services.js"
				]

				dest: 'dist/js/app.concat.js'
			}
		}

		sass:{
			dist: {
				files: [{
					src: 'css/main.scss'
					dest: 'dist/css/main.css'
				}]
			}
		}



		uglify: {
			options: {
				banner: '/* RDS */\n'
			}
			index: {
				src: 'dist/js/app.concat.js'
				dest: 'dist/js/app.min.js'
			}
		}

		



		clean: {
			release: [
				'dist/app.concat.js'
				'tmp/'
			]
		}


		copy: {
			build: {
				files: [

					nonull: true
					expand: true
					src: [
						'fonts/*'
						'img/*'
						'partials/*'
					]
					dest: "dist/"
				]
			}
		}

		dentist: {
			build: {
				options: {
					include_js: "js/app.min.js"
					include_css: "css/main.css"
				}
				src: 'index.html'
				dest_js: 'dist/app.init.js'
				dest_css: 'tmp/null'
				dest_html: 'dist/index.html'
			}
		}
	})


	grunt.loadNpmTasks 'grunt-contrib-concat'
	grunt.loadNpmTasks 'grunt-contrib-sass'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-dentist'

	grunt.registerTask('default', ['concat', 'sass', 'uglify', 'clean', 'copy',  'dentist'])
