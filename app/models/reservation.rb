class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates_presence_of :date, :city
end
