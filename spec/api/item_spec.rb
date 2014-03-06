require 'spec_helper'

describe 'Item API' do
  let!(:item) { create(:item) }
  let!(:user) { create(:user) }

  context 'with authentication_token' do
    it 'gets a list of items' do
      get '/items.json', authentication_token: user.authentication_token
      expect(response).to be_success
      expect(json['items'][0]['summary']).to eq(item.summary)
      expect(json['items'][0]['is_completed']).to eq(item.is_completed)
    end

    it 'creates a new item' do
      new_item = attributes_for(:item)
      post '/items.json', authentication_token: user.authentication_token, item: new_item
      expect(response).to be_success
      expect(Item.last.attributes).to include(new_item.stringify_keys)
    end

    it 'updates an existing item' do
      put "/items/#{item.id}.json", authentication_token: user.authentication_token, item: { summary: 'new summary' }
      expect(response).to be_success
      expect(Item.find(item.id).summary).to eq('new summary')
    end

    it 'deletes an existing item' do
      delete "/items/#{item.id}.json", authentication_token: user.authentication_token
      expect(response).to be_success
      expect { Item.find(item.id) }.to raise_error
    end
  end

  context 'without authentication_token' do
    it 'returns an error' do
      get '/items.json'
      expect(response.status).to be(401)
      expect(json['error']).to_not be_nil
    end
  end
end
