const mix = require('laravel-mix')
const path = require('path')
const cssImport = require('postcss-import')
const cssNesting = require('postcss-nesting')
const purgecss = require('@fullhuman/postcss-purgecss')
const SVGSpritemapPlugin = require('svg-spritemap-webpack-plugin')

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */
mix.js('resources/js/app.js', 'public/js')
  .sass('resources/sass/main.scss', 'public/css')
  .copy('resources/images', 'public/images')
  .copy([
    'resources/js/spritemap.js',
    'resources/js/spritemap.js.map',
  ], 'public/js')
  .options({
    postCss: [
      cssImport(),
      cssNesting(),
      ...mix.inProduction() ? [
        purgecss({
          content: ['./resources/views/**/*.blade.php', './resources/js/**/*.vue'],
          defaultExtractor: content => content.match(/[\w-/:.]+(?<!:)/g) || [],
          whitelistPatternsChildren: [/nprogress/],
        }),
      ] : [],
    ],
  })
  .webpackConfig({
    plugins: [
      new SVGSpritemapPlugin('resources/images/icons-sprite/*.svg', {
        output: {
          filename: '../resources/views/page/icons.blade.php',
        },
        sprite: {
          generate: {
            title: false,
          },
          prefix: 'icon-',
        },
      }),
    ],
    output: {
      chunkFilename: 'js/[name].js?id=[chunkhash]',
    },
    resolve: {
      alias: {
        vue$: 'vue/dist/vue.runtime.esm.js',
        '@': path.resolve('resources/js'),
      },
    },
  })
  .version()
  .sourceMaps()