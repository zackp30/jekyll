module Jekyll
  class Collection

    attr_reader :site, :name

    def initialize(site, name)
      @site = site
      @name = name
    end

    def path
      Jekyll.sanitized_path(site.source, "_#{name}")
    end

    def documents
      @documents ||= []
    end

    def add_document(info)
      documents << Document.new(collection, info)
    end

  end
end
