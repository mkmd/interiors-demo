# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source 'https://rubygems.org'

ruby '2.1.1'

gem "middleman", "~>3.3.0"

# Live-reloading plugin
gem "middleman-livereload"

# For faster file watcher updates on Windows:
gem "wdm", :platforms => [:mswin, :mingw]

# Windows does not come with time zone data
gem "tzinfo-data", platforms: [:mswin, :mingw]

platforms :ruby do
  # Required to do Coffee on Linux
  gem 'therubyracer'

  # gem 'rb-inotify', '~> 0.9.2'
end

# Sass stuff
gem 'sass', "~>3.3.0"
gem 'compass', "~>1.0.0.alpha.19"
gem 'slim'

#gem 'coffee-script'
#gem "middleman-smusher"
#gem "middleman-favicon-maker"  # generates favicon files in various sizes from a base image with ImageMagick
#gem "middleman-minify-html"

[ "money",
  ["animation"],
  'oily_png',
  "SassyLists",
  "sassy-buttons",
  'singularitygs',
  "singularity-quick-spanner",
  'breakpoint',
  'breakpoint-slicer',
  'toolkit',
  'sass-globbing',
  'sass-css-importer',
  'modular-scale',
].each do |dep|
  dep = [dep] unless dep.is_a? Array
  dep << { require: false }
  gem *dep
end
