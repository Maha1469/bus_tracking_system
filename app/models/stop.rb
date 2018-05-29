class Stop < ApplicationRecord
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :stop_number, presence: true
  validates :name, presence: true
  belongs_to :bus
end
