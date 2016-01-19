require 'csv'

module GlobalRegistryModels
  class Collection
    include Enumerable
    extend Forwardable

    def_delegators :@list, :[], :size, :concat, :blank?, :present?

    def initialize(meta:, list:)
      @meta = meta
      @list = list
    end

    def each
      @list.each { |object| yield object }
    end

    def all
      @list
    end

    def page
      @meta['page']
    end

    def last_page?
      !@meta['next_page']
    end

    def first_page?
      page == 1
    end

    def next_page
      last_page? ? nil : page + 1
    end

    def prev_page
      first_page? ? nil : page - 1
    end

    def from
      @meta['from']
    end

    def to
      @meta['to']
    end

    def per
      (to - from) + 1
    end

    def to_csv
      CSV.generate do |csv|
        attributes = @list.first.attributes.collect(&:first).sort
        csv << attributes
        @list.each do |entity|
          csv << attributes.collect { |attribute| entity.attributes[attribute] }
        end
      end
    end

  end
end
