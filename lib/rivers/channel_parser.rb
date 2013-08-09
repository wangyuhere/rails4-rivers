require 'open-uri'
require 'nokogiri'

module Rivers

  class ChannelParser

    @@instance = ChannelParser.new

    def parse(url)
      xml = Nokogiri::XML(open(url))
      xml.xpath('//items/item').map { |node| _build_item(node) }
    end

    private

    def _build_item(node)
      keys = [:id, :type_of_media, :url, :header, :summary, :image]
      dates = [:published_at, :created_at, :updated_at]
      item = {}
      keys.each { |k| item[k] = node.xpath(k.to_s).text }
      dates.each { |k| item[k] = node.xpath(k.to_s).attr('datetime').value }
      item
    end

    class << self
      def parse(url)
        @@instance.parse(url)
      end
    end
  end
  
end