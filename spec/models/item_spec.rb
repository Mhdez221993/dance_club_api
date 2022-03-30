require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create name: 'test', email: 'test@test.com', password: '123456' }
  subject do
    described_class.new name: 'Dancing',
                        description: 'Best dance',
                        finance: 129, option: 249, total: 9.299,
                        duration: 24, apr: 2.9, user_id: user.id
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    expect(Item.new).to_not be_valid
  end

  it { should belong_to(:user) }

  it { should have_many(:reservations) }

  it { should have_db_column(:name) }

  it { should have_db_column(:description) }

  it { should have_db_column(:finance) }

  it { should have_db_column(:option) }

  it { should have_db_column(:total) }

  it { should have_db_column(:duration) }

  it { should have_db_column(:apr) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:description) }

  it { should validate_presence_of(:finance) }

  it { should validate_presence_of(:option) }

  it { should validate_presence_of(:total) }

  it { should validate_presence_of(:duration) }

  it { should validate_presence_of(:apr) }
end
