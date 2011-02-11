module CssAssetTaggerOptions
  mattr_accessor :perform_tagging, :css_paths, :asset_path, :show_warnings

  @@perform_tagging = Rails.env.production?
  @@css_paths = %W(#{Rails.root}/public/stylesheets)
  @@asset_path = Rails.root.join('public')
  @@show_warnings = Rails.env.development?

  def self.setup
    yield self
  end
end
