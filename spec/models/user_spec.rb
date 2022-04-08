require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new name: 'test', email: 'test@test.com', password: '123456' }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    expect(User.new).to_not be_valid
  end

  it 'Validate the length of the password' do
    should validate_length_of(:password).is_at_least(6).on(:create)
  end

  it { should have_many(:items) }

  it { should have_many(:reservations) }

  it { should have_db_column(:name) }

  it { should have_db_column(:email) }

  it { should have_db_column(:role) }

  it { should have_db_column(:encrypted_password) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password) }
end
