class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :items
  has_many :reservations

  validates_presence_of :password, :email, :name
  validates_length_of :password, minimum: 6, on: :create

  def admin?
    role == 'admin'
  end
end
