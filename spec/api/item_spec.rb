require 'spec_helper'

describe 'Item API' do
  let!(:item) { create(:item) }
  let!(:user) { item.user }

  context 'with authentication_token' do
    it 'gets a list of items' do
      get '/items.json', authentication_token: user.authentication_token
      expect(response).to be_success
      expect(json['items'][0]['summary']).to eq(item.summary)
      expect(json['items'][0]['is_completed']).to eq(item.is_completed)
      expect(json['items'][0]['priority']).to eq(item.priority)
      expect(Date.parse(json['items'][0]['due_date'])).to eq(item.due_date)
      expect(json['items'].length).to eq(1)
    end

    it 'creates a new item for the user' do
      new_item = attributes_for(:item)
      post '/items.json', authentication_token: user.authentication_token, item: new_item
      expect(response).to be_success
      expect(Item.last.attributes).to include(new_item.stringify_keys)
      expect(Item.last.user).to eq(user)
    end

    it 'updates an existing item' do
      put "/items/#{item.id}.json", authentication_token: user.authentication_token,
             item: { summary: 'new summary' }
      expect(response).to be_success
      expect(Item.find(item.id).summary).to eq('new summary')
    end

    it 'deletes an existing item' do
      delete "/items/#{item.id}.json", authentication_token: user.authentication_token
      expect(response).to be_success
      expect { Item.find(item.id) }.to raise_error
    end

    context "attempted operations on other user's item" do
      let (:other_item) { create(:item) }

      it "doesn't get items belonging to someone else" do
        get '/items.json', authentication_token: user.authentication_token
        expect(response).to be_success
        expect(json['items'].length).to eq(1)
      end

      it "doesn't update an item belonging to someone else" do
        put "/items/#{other_item.id}.json", authentication_token: user.authentication_token,
              item: { summary: 'new summary' }
        expect(response.status).to eq(403)
        expect(Item.find(other_item.id).summary).to_not eq('new summary')
        expect(json['error']).to_not be_nil
      end

      it "doesn't delete an item belonging to someone else" do
        delete "/items/#{other_item.id}.json", authentication_token: user.authentication_token
        expect(response.status).to eq(403)
        expect { Item.find(other_item.id) }.not_to raise_error
        expect(json['error']).to_not be_nil
      end
    end

    context 'attempted operation on non-existant item' do
      it 'update returns an error' do
        put "/items/999999.json", authentication_token: user.authentication_token,
              item: { summary: 'new summary' }
        expect(response.status).to eq(404)
        expect(json['error']).to_not be_nil
      end

      it 'delete returns an error' do
        delete "/items/999999.json", authentication_token: user.authentication_token
        expect(response.status).to eq(404)
        expect(json['error']).to_not be_nil
      end
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
