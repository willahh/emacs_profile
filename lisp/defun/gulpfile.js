// https://github.com/marcinkrzeminski/gulp-starter-kit

var gulp = require('gulp');
var browserSync = require('browser-sync');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var cleanCSS = require('gulp-clean-css');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');
var imagemin = require('gulp-imagemin');
var changed = require('gulp-changed');
var htmlReaplce = require('gulp-html-replace');
var htmlMin = require('gulp-htmlmin');
var del = require('del');
var sequence = require('run-sequence');


// Liste des fichiers css a concatener
var cssList = ['layout/style.css'];

var config = {
    rootDir: 'project/arsia/arsia_standard_310/pimdatamanager_deploy_template/scripts/demo_api/site_mobile',
    // src: 'src/',
    // cssin: 'layout/css/**/*.css',
    // jsin: 'layout/js/**/*.js',
    // scssin: 'layout/scss/**/*.scss',
    // scssin: 'layout/*.scss',
    dist: 'dist/',
    src: 'layout/',
    cssin: 'layout/*.css',
    jsin: [
        'node_modules/jquery/dist/jquery.slim.min.js',
        'node_modules/popper.js/dist/umd/popper.js',
        'node_modules/bootstrap/dist/js/bootstrap.js',
        'layout/lib/goaland/utils/getViewportDimensions.js',
        'layout/lib/goaland/popin/popinmanager.js',
        'layout/lib/goaland/popin/popin.js'
        ],
    imgin: 'layout/img/**/*.{jpg,jpeg,png,gif}',
    htmlin: 'layout/*.html',
    scssin: 'layout/style.scss',
    cssout: 'dist/',
    jsout: 'dist/',
    imgout: 'dist/img/',
    htmlout: 'dist/',
    scssout: 'dist/',
    cssoutname: 'style.min.css',
    jsoutname: 'script.min.js',
    cssreplaceout: 'css/style.css',
    jsreplaceout: 'js/script.js'
};
gulp.task('reload', function() {
    browserSync.reload();
});

gulp.task('serve', ['sass'], function() {
    browserSync({
        server: config.src
    });

    gulp.watch([config.htmlin, config.jsin], ['reload']);
    gulp.watch(config.scssin, ['sass']);
});

gulp.task('sass', function() {
    return gulp.src(config.scssin)
        // .pipe(sourcemaps.init())
        .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
        .pipe(autoprefixer({
            browsers: ['last 3 versions']
        }))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest(config.scssout))
        .pipe(browserSync.stream());
});

gulp.task('sass_theme_bootstrap', function() {
    return gulp.src(config.src + 'theme_bootstrap.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(autoprefixer({
            browsers: ['last 3 versions']
        }))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest(config.scssout))
        .pipe(browserSync.stream());
});

gulp.task('css', function() {
    return gulp.src(config.cssin)
        .pipe(concat(config.cssoutname))
        .pipe(cleanCSS())
        .pipe(gulp.dest(config.cssout));
});

gulp.task('js', function() {
    return gulp.src(config.jsin)
        .pipe(concat(config.jsoutname))
        .pipe(uglify())
        .pipe(gulp.dest(config.jsout));
});

gulp.task('img', function() {
    return gulp.src(config.imgin)
        .pipe(changed(config.imgout))
        .pipe(imagemin())
        .pipe(gulp.dest(config.imgout));
});

gulp.task('html', function() {
    return gulp.src(config.htmlin)
        .pipe(htmlReaplce({
            'css': config.cssreplaceout,
            'js': config.jsreplaceout
        }))
        .pipe(htmlMin({
            sortAttributes: true,
            sortClassName: true,
            collapseWhitespace: true
        }))
        .pipe(gulp.dest(config.dist))
});

gulp.task('clean', function() {
    return del([config.dist]);
});

gulp.task('build', function() {
    // sequence('clean', ['html', 'js', 'css', 'img']);
    // sequence('clean', ['js', 'sass']);
    sequence(['js', 'sass']);
});




// https://codelabs.developers.google.com/codelabs/sw-precache/index.html
// (genere automatiquement le fichier sw.js contenant les chemins vers les resources)
// 
gulp.task('generate-service-worker', function(callback) {
    var path = require('path');
    var swPrecache = require('sw-precache');

    swPrecache.write(path.join(config.rootDir, 'sw.js'), {
        // staticFileGlobs: [config.rootDir + '/**/*.{js,html,css,png,jpg,gif}'],

        staticFileGlobs: [
            config.rootDir + '/',
            config.rootDir + '/module',
            config.rootDir + '/module/**/*.{js,html,php,css,png,jpg,gif}',
            config.rootDir + '/module/**/*.{js,html,php,css,png,jpg,gif}',
            config.rootDir + '/dist/**/*.{js,html,php,css,png,jpg,gif}'
        ],

        stripPrefix: config.rootDir
    }, callback);
});

gulp.task('default', ['serve']);