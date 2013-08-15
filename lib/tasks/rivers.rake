require 'rivers/channel_parser'

namespace :rivers do
  desc 'Fetch pearls(news) from river(channel)'
  task :fetch_pearls => :environment do
    parser = Rivers::ChannelParser.new
    River.find_each do |r|
      r.urls.each do |url|
        items = parser.parse url
        items.each { |i| r.add_pearl_from_item(i) }
      end
      r.fetched_at = Time.now
      r.save!
    end
  end
end
