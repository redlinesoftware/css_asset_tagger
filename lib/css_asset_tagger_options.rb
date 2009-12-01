module CssAssetTaggerOptions
  mattr_accessor :perform_tagging, :css_paths
end

CssAssetTaggerOptions.perform_tagging = Rails.env.production?
CssAssetTaggerOptions.css_paths = %W(#{RAILS_ROOT}/public/stylesheets)
