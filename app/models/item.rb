class Item < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates_presence_of :name, :description, :finance, :option, :total, :duration, :apr
end
