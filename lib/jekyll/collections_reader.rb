module Jekyll
  class CollectionsReader

    attr_reader :site

    def initialize(site)
      @site = site
    end

    def read(collection_name)
      collection = Collection.new(site, collection_name)
      base = collection.path
      return unless File.directory?(base) && (!safe || !File.symlink?(base))

      entries = Dir.chdir(base) { Dir['*.{yaml,yml}'] }
      entries.delete_if { |e| File.directory?(File.join(base, e)) }

      entries.each do |entry|
        path = File.join(collection.path, entry)
        next if File.symlink?(path) && safe

        key = sanitize_filename(File.basename(entry, '.*'))
        collection.add_document {
          # hm...
        }
      end

      collection
    end

  end
end
