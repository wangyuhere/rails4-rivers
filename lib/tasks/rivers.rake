require 'rivers/channel_parser'

namespace :rivers do
  desc 'Fetch pearls(news) from river(channel)'
  task :fetch_pearls => :environment do
    parser = Rivers::ChannelParser.new
    River.find_each do |r|
      items = parser.parse r.url
      items.each { |i| r.add_pearl_from_item(i) }
      r.fetched_at = Time.now
      r.save!
    end
  end
end
