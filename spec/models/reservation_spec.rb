require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create name: 'test', email: 'test@test.com', password: '123456' }
  let(:item) do
    user.items.create name: 'Dancing',
                      description: 'Best dance',
                      finance: 129, option: 249, total: 9.299,
                      duration: 24, apr: 2.9, user_id: user.id
  end

  subject { described_class.new date: 'Sun, 01 Jan 2012', city: 'Colombia', user_id: user.id, item_id: item.id }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    expect(Reservation.new).to_not be_valid
  end

  it { should belong_to(:user) }

  it { should have_db_column(:date) }

  it { should have_db_column(:city) }

  it { should validate_presence_of(:date) }

  it { should validate_presence_of(:city) }
end
