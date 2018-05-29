class Bus < ApplicationRecord
  attr_accessor :email, :password,  :password_confirmation
  validates :bus_number, presence: true
  validates :current_lat, presence: true
  validates :current_lan, presence: true
  validates :starting_lat, presence: true
  validates :starting_lan, presence: true
  validates :ending_lat, presence: true
  validates :ending_lan, presence: true
  validates :description, presence: true
  validates :evening_start_time, presence: true
  validates :evening_end_time, presence: true
  validates :morning_start_time, presence: true
  validates :morning_end_time, presence: true

  belongs_to :user
  has_many :stops
end
