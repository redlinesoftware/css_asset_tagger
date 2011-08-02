# see css_asset_tagger_options.rb for tagger options

config.to_prepare do
  CssAssetTaggerOptions.perform_tagging = Rails.env.production?
  CssAssetTaggerOptions.css_paths = %W(#{Rails.root}/public/stylesheets)
  CssAssetTaggerOptions.asset_path = "#{Rails.root}/public"
  CssAssetTaggerOptions.show_warnings = Rails.env.development?

  CssAssetTagger.tag(CssAssetTaggerOptions.css_paths) if CssAssetTaggerOptions.perform_tagging
end
