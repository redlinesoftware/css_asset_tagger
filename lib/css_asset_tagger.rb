class CssAssetTagger
  def self.tag(paths)
    paths.each do |path|
      files = Dir.glob(File.join(path, '**/*.css'))
      for file in files
        css = File.read file
        res = css.gsub!(/url\(("([^"]*)"|'([^']*)'|([^)]*))\)/mi) do |s|
          uri = $1.to_s
          if uri =~ /(\?|&)\d{10}/
            # query string appears to exist already, so the uri is returned as is
            "url(#{uri})"
          else
            # construct the uri with the associated asset query string
            asset_tag = File.stat(file).mtime.to_i
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
