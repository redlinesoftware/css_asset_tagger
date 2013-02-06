# CssAssetTagger

Adds asset query strings to assets found in css files.

## Install

In your Gemfile:  
`gem 'css_asset_tagger', :git => 'git://github.com/redlinesoftware/css_asset_tagger.git'`

## Example

Simply install the plugin and css files will be updated to include asset tags for any found assets.

before:  
`background: url("/images/background.png") repeat-x scroll 0 0 #ffffff;`

after:  
`background: url(/images/background.png?1296473764) repeat-x scroll 0 0 #ffffff;`

To modify the plugins behaviour, add an initializer file to config/initializers  

* __perform_tagging__ - Flag to determine if the css files should be modified with asset tags.  
    Defaults to tag in production only.
* __css_paths__ - An array of css stylesheet paths. Defaults to the main stylesheets path.  
    Defaults to ["#{Rails.root}/public/stylesheets"]
* __asset_path__ - The main asset path to be used when looking for assets with absolute file references.  
    Defaults to Rails.root.join('public')
* __show_warnings__ - Set to true to see warnings for assets that can't be found on the filesystem or false to not show the warnings.  
    Defaults to showing warnings in dev mode only.

ex. config/initializers/css_tagger_options.rb

    require 'css_asset_tagger_options'
    
    CssAssetTaggerOptions.setup do |config|
      config.perform_tagging = true
    end

Copyright (c) 2009-2013 Redline Software Inc., released under the MIT license
