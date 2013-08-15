class River < ActiveRecord::Base

  has_many :pearls
  serialize :channel_ids, Array

  def self.generate_url(api_key, channel_id)
    "http://www.mynewsdesk.com/partner/api/1_0/#{api_key}/channel/#{channel_id}/material/list"
  end

  # add pearl from item to river
  # if item already saved, fetch and return pearl directly
  def add_pearl_from_item(item)
    params = item.clone
    params[:item_id] = item[:id]
    params.delete :id
    pearls.where(item_id: item[:id], type_of_media: item[:type_of_media]).first_or_create(params)
  end

  def urls
    channel_ids.map { |i| url_from_channel_id i }
  end

  private
  def url_from_channel_id(channel_id)
    River.generate_url api_key, channel_id
  end
end
