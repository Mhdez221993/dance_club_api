require 'rails_helper'
require 'devise/jwt/test_helpers'

describe 'Users controller', type: :request do
  let!(:user) { User.create name: 'Test', email: 'testing@test.com', password: '123456', role: 'admin' }
  let!(:item) { user.items.create name: "Dancing flow", description: "Improvise dance", finance: 129, option: 249, total: 9.299, duration: 24, apr: 2.9 }
  let!(:items) { Item.all }
  let!(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let!(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  it 'Fetch items' do

    get '/api/items', headers: auth_headers

    expect(response.body).to eq items.to_json
  end

  it 'Successfully create Item' do
    new_item = { name: "Dancing with God", description: "Improvise dance", finance: 129, option: 249, total: 9.299, duration: 24, apr: 2.9 }

    post '/api/items', headers: auth_headers, params: { item: new_item }.to_json

    expect(response.body).to eq items.last.to_json

    get '/api/items', headers: auth_headers

    expect(response.body).to eq items.to_json
  end
end
