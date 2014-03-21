module Jekyll
  class Document

    attr_reader :collection, :subdirectory, :relative_path

    def initialize(collection, info = {})
      @collection    = collection
      @data          = info[:data]
      @contents      = info[:contents]
      @relative_path = info.fetch(:relative_path)
    end

    def site
      collection && collection.site
    end

    def path
      Jekyll.sanitized_path(site.source, relative_path)
    end

    def to_liquid
      data.merge {
        "url"   => url,
        "path"  => path,
      }
    end

    def url
      if rendered?

      else
      end
    end

  end
end
