'use strict';

module.exports = function (grunt) {
    require('load-grunt-tasks')(grunt);

    grunt.initConfig({
        watch: {
            web: {
                files: ['build/asciidoc/html5/chapters/**/*.html']
            }
        },
        browserSync: {
            dev: {
                bsFiles: {
                    src : [
                        'build/asciidoc/html5/**/*.html',
                        'build/asciidoc/html5/images/**/*.{png,jpg,jpeg,gif,webp,svg}'
                    ]
                }
            },
            options: {
                watchTask: true,
                server: {
                    baseDir: "./build/asciidoc/html5/"
                }
            }
        }
    });

    grunt.registerTask('serve', [
        'browserSync',
        'watch'
    ]);

    grunt.registerTask('default', [
        'serve'
    ]);
};
