class ApiRiverChannelsSupport < ActiveRecord::Migration
  def up
    add_column :rivers, :channel_ids, :string
    add_column :rivers, :api_key, :string
    River.all.each do |river|
      set_api_key_and_channel_from_url river
    end
    rename_column :rivers, :url, :old_url
  end

  def down
    remove_column :rivers, :channel_ids
    remove_column :rivers, :api_key
    rename_column :rivers, :old_url, :url
  end

  def set_api_key_and_channel_from_url(river)
    puts "* Setting api_key and channel_ids on River #{river.id}"
    return unless river.url
    matches = river.url.match(%r[^http://www.mynewsdesk.com/partner/api/1_0/(?<api_key>\w+)/channel/(?<channel_id>\d+)/])
    if matches
      puts "* matching"
      river.api_key = matches[:api_key]
      river.channel_ids = [matches[:channel_id]].to_json
      river.save!
    else
      puts "Error: wrong url with river id: #{river.id}, #{river.url}"
    end
  end
end
