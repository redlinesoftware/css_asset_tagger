class CssAssetTagger
  def self.tag(paths)
    paths.each do |path|
      files = Dir.glob(File.join(path, '**/*.css'))
      for file in files
        css = File.read file
        res = css.gsub!(/url\(("([^"]*)"|'([^']*)'|([^)]*))\)/mi) do |s|
          # use $2 first if found, otherwise $1
          # $2 will hold an unquoted string if quotes were used, but nil if they weren't
          uri = ($2 || $1).to_s

          # if the uri appears to begin with a protocol then the asset isn't on the local filesystem
          # or if query string appears to exist already, the uri is returned as is
          if uri =~ /[a-z]+:\/\//i || uri =~ /(\?|&)\d{10}/
            "url(#{uri})"
          else
            # if the first char is a / then get the path of the file with respect to the absolute path of the asset files
            # otherwise get the path relative to the current file
            path = (uri.first == '/' ? "#{CssAssetTaggerOptions.asset_path}#{uri}" : "#{File.dirname(file)}/#{uri}")
            asset_tag = File.stat(path).mtime.to_i

            # construct the uri with the associated asset query string
            sep = (uri =~ /\?/).nil? ? '?' : '&'
            "url(#{uri}#{sep}#{asset_tag})"
          end
        end

        # write the new contents of the file out if asset tags were added
        File.open(file, 'w'){|f| f.puts css} unless res.nil?
      end
    end
  end
end
