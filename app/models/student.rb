class Student < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :roll_number, presence: true
  validates :batch_number, presence: true
  validates :semester, presence: true
  validates :department, presence: true
end
