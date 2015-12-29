require 'rails_helper'

RSpec.describe TradesController, type: :controller do
  let!(:token) { create(:api_token).token }

  context '#last_tid' do
    let!(:list) { create_list(:trade, 2) }

    it 'fetch last tid' do
      get :last_tid, token: token
      expect(JSON.parse(response.body)['tid']).to eq(list.last.tid)
    end
  end

  context '#create' do
    let(:valid) { build(:trade) }

    it 'valid' do
      result = nil

      expect {
        post :create, { token: token }.merge(valid.serializable_hash)
        result = JSON.parse(response.body)
      }.to change { Trade.count }.by(1)

      expect(result['success']).to be(true)
      expect(result['tid']).to eq(valid.tid)
    end

    it 'invalid' do
      result = nil

      expect do
        post :create, { token: token}.merge(valid.serializable_hash(except: [:tid]))
        result = JSON.parse(response.body)
      end.not_to change { Trade.count }

      expect(result['success']).to be(false)
      expect(result['errors']['tid']).to include("can't be blank")
    end
  end
end
