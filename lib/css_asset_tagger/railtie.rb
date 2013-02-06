require 'rails/railtie'

module CssAssetTaggerOptions
  class Railtie < Rails::Railtie
    rake_tasks do
      Dir[File.expand_path('../../tasks/*.rake', __FILE__)].each { |f| load f }
    end

    config.to_prepare do
      CssAssetTagger.tag(CssAssetTaggerOptions.css_paths) if CssAssetTaggerOptions.perform_tagging
    end
  end
end
