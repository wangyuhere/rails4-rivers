require 'lib_spec_helper'
require 'rivers/channel_parser'

describe Rivers::ChannelParser do
  include ResourseLoader

  it 'should parse channel contents and return items' do
    test_site = 'http://www.mynewsdesk.com/partner/api/1_0/LY6eZJ5rZDqDuzBQWBHbVA/channel/607/material/list'
    parser = Rivers::ChannelParser.new
    parser.stub(:open).with(test_site).and_return(load_resource('channels', 'channel_607'))
    items = parser.parse test_site
    expect(items.count).to eql(7)

    expected_item = {
      id: '20073',
      type_of_media: 'blog_post',
      url: 'http://www.mynewsdesk.com/uk/mynewsdesk/blog_posts/digital-tools-for-pr-pros-that-will-transform-your-working-day-20073',
      header: 'Digital tools for PR pros that will transform your working day',
      summary: 'Katie Moffat, an Online PR and social media specialist, presents the top digital tools to make your working life easier and more efficient. ',
      image: 'http://a5.mndcdn.com/image/upload/tftkxigfpcuqgxhvc2dq.png',
      published_at: '2013-07-31T15:42:00Z',
      created_at: '2013-07-30T16:32:31Z',
      updated_at: '2013-08-01T08:01:22Z',
    }
    expect(items.first).to eql(expected_item)
  end

  it 'should return empty array if contnets is empty' do
    test_site = 'http://test.com'
    parser = Rivers::ChannelParser.new
    parser.stub(:open).with(test_site).and_return(load_resource('channels', 'channel_empty'))
    items = parser.parse test_site
    expect(items).to eql([])
  end
end
