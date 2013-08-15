require 'spec_helper'

describe River do
  let(:river) { FactoryGirl.create :river }

  context 'add_pearl_from_item' do
    let(:item) { {
      id: '123',
      type_of_media: 'blog_post',
      url: 'http://www.mynewsdesk.com/',
      header: 'header',
      summary: 'summary',
      image: 'test.png',
      published_at: '2013-07-31T15:42:00Z',
      created_at: '2013-07-30T16:32:31Z',
      updated_at: '2013-08-01T08:01:22Z',
    } }

    it 'should create pearl from item and add to river' do
      pearl = river.add_pearl_from_item item
      expect(pearl.river_id).to eql(river.id)
      expect(pearl.item_id).to eql(item[:id])
      expect(pearl.url).to eql(item[:url])
      expect(pearl.published_at.to_datetime).to eql(item[:published_at].to_datetime)
      expect(pearl.created_at.to_datetime).to eql(item[:created_at].to_datetime)
      expect(pearl.updated_at.to_datetime).to eql(item[:updated_at].to_datetime)
    end

    it 'should not add pearl and return pearl if item already exists' do
      river.add_pearl_from_item item
      old_count = river.pearls.count
      old_pearl = river.pearls.first
      pearl = river.add_pearl_from_item item
      expect(pearl).to eql(old_pearl)
      expect(river.pearls.count).to eql(old_count)
    end

    it "should add pearl if items have same id and with different type_of_media" do
      river.add_pearl_from_item item
      item_with_same_id = item.clone
      item_with_same_id[:type_of_media] = 'image'
      river.add_pearl_from_item item_with_same_id
      expect(river.pearls.count).to eql(2)
    end
  end
end
