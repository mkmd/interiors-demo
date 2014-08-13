###
# Compass
###
# require "compass"

# Compass extensions
require 'slim'
# require 'sprockets'
#require "middleman-smusher"
# require 'sass-globbing'
require 'sass-css-importer'
require 'breakpoint'
# require 'breakpoint-slicer'
require 'singularitygs'
require 'singularity-quick-spanner'
require 'toolkit'
# require 'modular-scale'
require 'animation'
require 'SassyLists'
# require 'sassy-buttons'
#require 'susy'
#require 'favicon_maker'

# Timezone stuff
require 'tzinfo'

require "helpers/utilities"
require "helpers/sass"

helpers Utilities

Slim::Engine.disable_option_validator!

# Change Compass confguration
compass_config do |config|
  config.output_style = (environment == :development) ? :nested : :compressed
  config.sass_options = (environment == :development) ? { debug_info: true, :sourcemap => true } : {}  # quiet: true,
  # config.enable_sourcemaps = true
  config.add_import_path Sass::CssImporter::Importer.new(File.join(source_dir, js_dir))
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# link_to 'My Form', '/form.html', :query => { :foo => 'bar' }, :fragment => 'deep'
data.sitemap.main.each do |folder|
  proxy "/#{folder.id}.html", "/catalogue.html", :locals => { :folder => folder.id }
end

###
# Helpers
###

# set :sass, { debug_info: true, :sourcemap => true }

set :frontmatter_extensions, %w(.html .slim .erb .haml)

# Use relative URLs
#activate :relative_assets

# Relative links are required for Github Pages
# set :relative_links, true

# Pretty URLs
# activate :directory_indexes

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Set slim-lang output style
Slim::Engine.set_default_options :pretty => true

#set :js_assets_paths, [File.join(File.expand_path(File.dirname(__FILE__)), 'vendors')]

# Set template languages
set :slim, { :format => :html5 }  # :layout_engine => :slim

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

set :partials_dir, 'partials'
set :layout, 'default'

# Development-specific configuration
# Reload the browser automatically whenever files change
activate :livereload
activate :cache_buster

# Chrome needs a precision of 7 to round properly
Sass::Script::Number.precision = 7

#set :debug_assets, true

set :file_watcher_ignore, [
  /^bin\//,
  /^\.bundle\//,
  /^vendor\//,
  /^\.sass-cache\//,
  /^\.cache\//,
  /^\.git\//,
  /^\.gitignore$/,
  /\.DS_Store/,
  /^\.rbenv-.*$/,
  /^\.idea\/$/,
  /^Gemfile$/,
  /^Gemfile\.lock$/,
  /^Gruntfile\.js$/,
  /^package\.json$/,
  /^[a-zA-Z0-9_-]+\.iml$/,
  /~$/,
  /(^|\/)\.?#/,
  /^tmp\//,
  /^build\//,
  /^materials\//,
  /^\.bowerrc\//,
  /^bower_components\//,
  /^node_modules\//
]

configure :development do
  activate :directory_indexes
end

after_configuration do
  ## Add bower's directory to sprockets asset path
  #@bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  # sprockets.import_asset 'jquery-mobile'
  #sprockets.append_path File.join "#{root}", File.join(source_dir, js_dir)  # @bower_config["directory"]
end

# Build-specific configuration
configure :build do
  set :build_dir, "../markup-build"

  activate :relative_assets

  # Relative links are required for Github Pages
  set :relative_links, true

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # Enable cache buster activate :cache_buster
  activate :cache_buster

  # Compress PNGs after build
  #activate :smusher

  #activate :favicon_maker, :icons => {
  #    "favicon_template.png" => [
  #        { icon: "apple-touch-icon-152x152-precomposed.png" },
  #        { icon: "apple-touch-icon-114x114-precomposed.png" },
  #        { icon: "apple-touch-icon-72x72-precomposed.png" },
  #    ]
  #}

  #activate :minify_html
end

