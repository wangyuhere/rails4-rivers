require 'spec_helper'

describe RiversController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe 'GET /rivers/:id/fetch' do

    let(:pearl) { FactoryGirl.create :pearl }

    it 'should return error json if river is not found' do
      get 'fetch', { id: 999, last_pearl_id: 1}
      expect(response.body).to eql({error: 'river does not exist'}.to_json)
    end

    it 'should return error json if last_pearl_id does not exist' do
      get 'fetch', { id: pearl.river.id, last_pearl_id: 99}
      expect(response.body).to eql({error: 'last_pearl_id does not exist'}.to_json)
    end

    it 'should return empty pearls if there is no pearls after last_pearl_id' do
      get 'fetch', { id: pearl.river.id, last_pearl_id: pearl.id}
      expect(response.body).to eql({pearls: []}.to_json)
    end

    it 'should return recentlly added pearl after the last_pearl_id' do
      new_pearl = FactoryGirl.create :pearl, river: pearl.river
      get 'fetch', { id: pearl.river.id, last_pearl_id: pearl.id}
      expect(response).to render_template('rivers/_pearl')
      expect(assigns(:pearls).to_a).to eql([new_pearl])
      expect(JSON.parse(response.body)['pearls'].count).to eql(1)
    end
  end

end
