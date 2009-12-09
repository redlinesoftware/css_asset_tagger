module CssAssetTaggerOptions
  mattr_accessor :perform_tagging, :css_paths, :asset_path
end

CssAssetTaggerOptions.perform_tagging = Rails.env.production?
CssAssetTaggerOptions.css_paths = %W(#{RAILS_ROOT}/public/stylesheets)
CssAssetTaggerOptions.asset_path = "#{RAILS_ROOT}/public"
