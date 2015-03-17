gulp.task "default", ["js", "sass", "images", "fonts"]

sourceMaps   = require "gulp-sourcemaps"
liveReload   = require "gulp-livereload"
filter       = require "gulp-filter"
coffee       = require "gulp-coffee"
sass         = require "gulp-sass"
autoPrefixer = require "gulp-autoPrefixer"

gulp.task "js", ->
  gulp.src("src/js")
    .pipe(sourceMaps.init())
    .pipe(coffeeFilter)
    .pipe(coffee())
    .pipe(coffeeFilter.restore())
    .pipe(concat("application.js"))
    .pipe(sourceMaps.write("."))
    .pipe(gulp.dest("../public/assets"))
    .pipe(liveReload())

gulp.task "sass", ->
  gulp.src("src/sass/application.css.scss")
    .pipe(sourceMaps.init())
    .pipe(sass({includePaths: "path/to/code", sourceComments: true, errLogToConsole: true}))
    .pipe(autoprefixer())
    .pipe(rename("application.css"))
    .pipe(sourceMaps.write("."))
    .pipe(gulp.dest("../public/assets"))
    .pipe(liveReload())

gulp.task "images", ->
  gulp.src("images/**/*")
    .pipe(gulp.dest("../public/assets/images/"))
    .pipe(liveReload())
