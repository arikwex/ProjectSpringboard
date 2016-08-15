module.exports = (grunt) ->
  grunt.initConfig(
    concurrent:
      dev: ['nodemon', 'watch']
      options:
        logConcurrentOutput: true

    nodemon:
      run:
        script: 'src/server/run.coffee'
        options:
          watch: ['src/server']
          delay: 300

    browserify:
      client:
        files:
          'dist/build.js': ['src/client/scripts/**/*.coffee']
        options:
          browserifyOptions:
            transform: ['coffeeify']
            extensions: ['.coffee']

    less:
      client:
        files:
          'dist/style.css': 'src/client/styles/core.less'

    watch:
      client:
        files: ['src/client/scripts/**/*.coffee']
        tasks: ['browserify']
        options:
          spawn: false
      less:
        files: ['src/client/styles/**/*.less']
        tasks: ['less']
        options:
          spawn: false
  )

  grunt.loadNpmTasks('grunt-nodemon')
  grunt.loadNpmTasks('grunt-concurrent')
  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-less')

  grunt.registerTask('default', [
    'less'
    'browserify'
    'concurrent'
  ])
  return
