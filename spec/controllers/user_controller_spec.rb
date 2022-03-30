require 'rails_helper'
require 'devise/jwt/test_helpers'

describe 'Users controller', type: :request do
  let!(:user) { User.create name: 'Test', email: 'testing', password: '123456' }
  it 'return http status' do
    get '/users/sign_in'
    expect(response).to have_http_status(:ok)
  end

  it 'it sing_in successfully' do
    # user = fetch_my_user()
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    # This will add a valid token for `user` in the `Authorization` header
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)

    get '/api/items', headers: auth_headers

    expect(response.body).to eq "[]"
  end
end
