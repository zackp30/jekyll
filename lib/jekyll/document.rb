module Jekyll
  class Document

    attr_reader :collection, :subdirectory, :filename

    def initialize(collection, data = {}, contents = "", file_metadata = {})
      @collection    = collection
      @data          = data
      @contents      = contents
      @file_metadata = file_metadata
    end

    def site
      collection && collection.site
    end

    def path
      Jekyll.sanitized_path(site.source, relative_path)
    end

    def relative_path
      File.join(file_metadata["subdirectory"], file_metadata["filename"])
    end

  end
end
