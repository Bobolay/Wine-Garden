# config/initializers/compression.rb
f = Rails.root.join("config/production_config.rb")
if File.exists?(f)
  require f
end

if !defined?(PRODUCTION_CONFIG)
  PRODUCTION_CONFIG = {}
end


PRODUCTION_CONFIG[:enable_compression] ||= Rails.env.production? || !!ENV['ENABLE_COMPRESSION']
PRODUCTION_CONFIG[:caching] ||= true
PRODUCTION_CONFIG[:compile] ||= true
PRODUCTION_CONFIG[:precompile] ||= true
PRODUCTION_CONFIG[:gzip] ||= true
PRODUCTION_CONFIG[:deflate] ||= true
PRODUCTION_CONFIG[:debug] ||= true
PRODUCTION_CONFIG[:js_compress] ||= true
PRODUCTION_CONFIG[:css_compress] ||= true
PRODUCTION_CONFIG[:html_compress] ||= true


Rails.application.configure do
  # Use environment names or environment variables:
  break if !PRODUCTION_CONFIG[:enable_compression]
  PRODUCTION_CONFIG_APPLIED = true

  # Strip all comments from JavaScript files, even copyright notices.
  # By doing so, you are legally required to acknowledge
  # the use of the software somewhere in your Web site or app:
  uglifier = Uglifier.new output: { comments: :none }

  # To keep all comments instead or only keep copyright notices (the default):
  # uglifier = Uglifier.new output: { comments: :all }
  # uglifier = Uglifier.new output: { comments: :copyright }

  config.assets.compile = PRODUCTION_CONFIG[:compile]
  config.assets.debug = false

  if PRODUCTION_CONFIG[:js_compress]
    config.assets.js_compressor = uglifier
  end

  if PRODUCTION_CONFIG[:css_compress]
    config.assets.css_compressor = :sass
  end

  if PRODUCTION_CONFIG[:deflate]
    config.middleware.use Rack::Deflater
    #config.middleware.insert Rack::Deflater
  end



  if PRODUCTION_CONFIG[:html_compress]
    config.middleware.use HtmlCompressor::Rack,
                          compress_css: true,
                          compress_javascript: true,
                          css_compressor: Sass,
                          enabled: true,
                          javascript_compressor: uglifier,
                          preserve_line_breaks: false,
                          remove_comments: true,
                          remove_form_attributes: false,
                          remove_http_protocol: false,
                          remove_https_protocol: false,
                          remove_input_attributes: true,
                          remove_intertag_spaces: false,
                          remove_javascript_protocol: true,
                          remove_link_attributes: true,
                          remove_multi_spaces: true,
                          remove_quotes: true,
                          remove_script_attributes: true,
                          remove_style_attributes: true,
                          simple_boolean_attributes: true,
                          simple_doctype: false
  end



  # caching
  if PRODUCTION_CONFIG[:caching]
    config.middleware.use Rack::PageCaching,
                          # Directory where the pages are stored. Defaults to the public folder in
                          # Rails, but you'll probably want to customize this
                          page_cache_directory: Rails.public_path,
                          # Gzipped version of the files are generated with compression level
                          # specified. It accepts the symbol versions of the constants in Zlib,
                          # e.g. :best_speed and :best_compression. To turn off gzip, pass in false.
                          gzip: :best_speed,
                          # Hostnames can be included in the path of the page cache. Default is false.
                          include_hostname: false
  end
end