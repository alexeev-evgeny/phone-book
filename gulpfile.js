'use strict';

var gulp = require('gulp'),
    slim = require("gulp-slim"), 
    sass = require('gulp-sass'),
    coffee = require('gulp-coffee'),
    sourcemaps = require('gulp-sourcemaps'),
    changed = require('gulp-changed'),
    debug = require('gulp-debug'),
    util = require('gulp-util'),
    webserver = require('gulp-webserver');

gulp.task('render-index', function() {
    var template = require('gulp-template'),
        contents = require('fs').readFileSync('assets.json', 'utf8'),
        assets = JSON.parse(contents);

  return gulp
    .src('./src/views/index.slim')
    .pipe(template({assets: assets}))
    .pipe(slim({
      pretty: true
    }))
    .on('error', function(message) {
      util.log(util.colors.red(message));
      this.emit('end');
    })
    .pipe(debug({title: 'render-index:'}))
    .pipe(gulp.dest('./build/'));
});

gulp.task('compile-slim', function(){
    return gulp
        .src("./src/views/*.slim")
        .pipe(slim({
          pretty: true
        }))
        .pipe(debug({title: 'compile-slim:'}))
        .pipe(gulp.dest("./build/"));
});

gulp.task('compile-sass', function () {
    return gulp
        .src('./src/css/*')
        .pipe(sass().on('error', sass.logError))
        .pipe(debug({title: 'compile-scss:'}))
        .pipe(gulp.dest('./build/css/'));
});

gulp.task('compile-coffee', function() {
    return gulp
        .src(['src/**/*.coffee'])
        .pipe(sourcemaps.init())
        .pipe(changed('build/js', {extension: '.js'}))
        .pipe(coffee())
        .on('error', function(message) {
            util.log(message);
            this.end();
        })
        .pipe(sourcemaps.write())
        .pipe(debug({title: 'compile-coffee:'}))
        .pipe(gulp.dest('./build/'));
});

gulp.task('copy-vendor-css', function() {
    return gulp
        .src([
            'node_modules/normalize-css/normalize.css'
        ])
        .pipe(gulp.dest('./build/css/'));
});

gulp.task('copy-vendor-js', function() {
    return gulp
        .src([
            'node_modules/angular/angular.js',
            'node_modules/angular-route/angular-route.js',
        ])
        .pipe(gulp.dest('./build/js/'));
});

gulp.task('webserver', function() {
  gulp.src('build')
    .pipe(webserver({
        livereload: false,
        open: true,
        port: 8080
    }));
});

gulp.task('compile', [
    'compile-slim',
    'compile-sass',
    'compile-coffee',

    'copy-vendor-js',
    'copy-vendor-css',

    'render-index'
]);

gulp.task('compile:watch', function () {
  gulp.watch('./src/views/**/*.slim', ['compile-slim', 'render-index']);
  gulp.watch('./src/css/**/*.scss', ['compile-sass']);
  gulp.watch('./src/js/**/*.coffee', ['compile-coffee']);
  gulp.start('webserver');
});

