'use strict';

var debug = require('gulp-debug'),
    gulp = require('gulp'),
    slim = require("gulp-slim"), 
    sass = require('gulp-sass'),
    coffee = require('gulp-coffee'),
    concat = require('gulp-concat'),
    sourcemaps = require('gulp-sourcemaps'),
    changed = require('gulp-changed'),
    util = require('gulp-util'),
    inject = require('gulp-inject'),
    angularOrder = require('gulp-angular-order'),
    webserver = require('gulp-webserver');

// ==========
// COMPILE SLIM 
// ==========
gulp.task('compile-slim', function(){
    return gulp
        .src(['./src/views/**/*.slim', '!./src/views/index.slim'])
        .pipe(slim({
          pretty: true
        }))
        .pipe(debug({title: 'compile-slim:'}))
        .pipe(gulp.dest("./build/views/"));
});

// ==========
// COMPILE SCSS 
// ==========
gulp.task('compile-sass', function () {
    return gulp
        .src('./src/css/app.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(debug({title: 'compile-scss:'}))
        .pipe(gulp.dest('./build/css/'));
});

// ==========
// COMPILE COFFEE
// ==========
gulp.task('compile-coffee', function() {
    return gulp
        .src(['src/**/*.coffee'])
        .pipe(sourcemaps.init())
        .pipe(changed('build/', {extension: '.js'}))
        .pipe(coffee())
        .on('error', function(message) {
            util.log(message);
            this.end();
        })
        .pipe(sourcemaps.write())
        .pipe(concat('app.js'))
        .pipe(debug({title: 'compile-coffee:'}))
        .pipe(gulp.dest('./build/js/'));
});

// ==========
// COPY VENDOR CSS 
// ==========
gulp.task('copy-vendor-css', function() {
    return gulp
        .src([
            'node_modules/normalize-css/normalize.css',
            'node_modules/mdi/css/materialdesignicons.css'
        ])
        .pipe(gulp.dest('./build/css/'));
});

// ==========
// COPY VENDOR JS 
// ==========
gulp.task('copy-vendor-js', function() {
    return gulp
        .src([
            'node_modules/angular/angular.js',
            'node_modules/angular-route/angular-route.js'
        ])
        .pipe(gulp.dest('./build/js/'));
});

// ==========
// COPY VENDOR FONTS
// ==========
gulp.task('copy-vendor-fonts', function() {
  return gulp
    .src([
        'node_modules/mdi/fonts/*'
    ])
    .pipe(changed('build/fonts'))
    .pipe(debug({title: 'copy-fonts:'}))
    .pipe(gulp.dest('build/fonts'));
});

// ==========
// COMPILE INDEX 
// ==========
gulp.task('compile-index', function(){
    var injectOptions = {ignorePath: '/build', addRootSlash: false};
    return gulp
        .src('./src/views/index.slim')
        .pipe(inject(
            gulp.src([
                './build/js/**/*.js',
                './build/css/app.css'
                ], {read: true})
                .pipe(angularOrder()),
                injectOptions
        ))
        .pipe(slim({
            pretty: true
        }))
        .pipe(gulp.dest('./build/'))
});

// ==========
// START WEBSERVER 
// ==========
gulp.task('webserver', function() {
  gulp.src(['build', 'data'])
    .pipe(webserver({
        livereload: false,
        open: true,
        port: 8080
    }));
});

// ==========
// COMPILE ALL
// ==========
gulp.task('compile', [
        'compile-slim',
        'compile-sass',
        'compile-coffee',

        'copy-vendor-js',
        'copy-vendor-css',
        'copy-vendor-fonts'
    ], 
    function(){
        gulp.start(['compile-index'])
    }
);

// ==========
// COMPILE ALL & START WEBSERVER 
// ==========
gulp.task('compile:watch', function () {
    gulp.start('compile');
    gulp.watch('./src/views/**/*.slim', ['compile-slim', 'compile-index']);
    gulp.watch('./src/css/**/*.scss', ['compile-sass']);
    gulp.watch('./src/js/**/*.coffee', ['compile-coffee']);
    gulp.start('webserver');
});

