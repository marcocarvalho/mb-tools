require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { create(:user, password: '1234') }

  it 'not auth' do
    post :auth, email: 'mimimi@momomo.com', password: 'bliblibli'
    expect(response.code).to eq('403')
    expect(response.body).to eq({ messages: ['not authorized'] }.to_json) 
  end

  it 'auth without valid token' do
    expect do
      post :auth, email: user.email, password: '1234'
    end.to change { user.api_tokens.count }.by(1)

    expect(response.code).to eq('200')
    expect(JSON.parse(response.body).keys).to eq(['token'])
  end

  it 'auth with valid token' do
    token = user.create_token

    expect do
      post :auth, email: user.email, password: '1234'
    end.not_to change { user.api_tokens.count }

    expect(response.code).to eq('200')
    expect(JSON.parse(response.body)['token']).to eq(token.token)
  end


  it 'auth with expired token must create a new one' do
    token = user.create_token
    token.valid_until = 1.second.ago
    token.save

    expect do
      post :auth, email: user.email, password: '1234'
    end.to change { user.api_tokens.count }.by(1)

    expect(response.code).to eq('200')
    expect(JSON.parse(response.body)['token']).not_to eq(token.token)
  end

end