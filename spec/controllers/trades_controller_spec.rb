require 'rails_helper'

RSpec.describe TradesController, type: :controller do
  context '#last_tid' do
    let!(:list) { create_list(:trade, 2) }

    it 'fetch last tid' do
      get :last_tid
      expect(JSON.parse(response.body)['tid']).to eq(list.last.tid)
    end
  end
end
