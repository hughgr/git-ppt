module.exports = (grunt) ->
    grunt.initConfig(
        pkg: grunt.file.readJSON 'package.json'
        css_root: 'static/css/'
        less:
            development:
                options: {}
                files:
                    '<%= css_root %>app.css': '<%= css_root %>less/entry.less'
            production:
                options:
                    compress: true
                files:
                    '<%= css_root %>app.min.css': '<%= css_root %>less/entry.less'
        watch:
            css:
                options:
                    livereload: true
                files: ['<%= css_root %>less/**/*.less']
                tasks: ['less:development']
    )
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-less'

    grunt.registerTask 'default', ['less:development']
    grunt.registerTask 'production', ['less:production']
