require 'rails_helper'
require 'devise/jwt/test_helpers'

describe 'Reservations controller', type: :request do
  let!(:user) { User.create name: 'Test', email: 'testing@test.com', password: '123456', role: 'admin' }
  let!(:item) do
    user.items.create name: 'Dancing flow', description: 'Improvise dance', finance: 129, option: 249, total: 9.299,
                      duration: 24, apr: 2.9
  end
  let!(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }
  let!(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  it 'Fetch reservations' do
    get '/api/reservations', headers: auth_headers

    expect(response.body).to eq Reservation.all.to_json
  end

  it 'Successfully create Item' do
    new_reservation = { date: 'Wed, 30 Mar 2022', city: 'Colombia', item_id: item.id, user_id: user.id }

    post '/api/reservations', headers: auth_headers, params: { reservation: new_reservation }.to_json

    expect(response.body).to eq Reservation.last.to_json

    get '/api/reservations', headers: auth_headers

    expect(response.body).to eq Reservation.all.to_json
  end
end
