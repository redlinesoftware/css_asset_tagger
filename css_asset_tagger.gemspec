# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "css_asset_tagger/version"

Gem::Specification.new do |s|
  s.name = "css_asset_tagger"
  s.version = CssAssetTaggerOptions::VERSION.dup
  s.platform = Gem::Platform::RUBY
  s.summary = "Tags assets in Rails app css files with asset query strings."
  s.email = "andrew@redlinesoftware.com"
  s.homepage = "https://github.com/redlinesoftware/css_asset_tagger"
  s.description = "Tags assets in Rails app css files with asset query strings."
  s.authors = ['Andrew Kaspick']

  s.license = 'MIT'
  s.files = Dir["MIT-LICENSE", "README.md", "lib/**/*"]
  s.test_files = Dir["test/**/*.rb"]
  s.require_paths = ["lib"]

  s.add_dependency('rails', '>= 3.0')
end
