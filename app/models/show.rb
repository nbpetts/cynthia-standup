class Show < ApplicationRecord
  #attr_accessor :date
  default_scope -> { order(:date) }
  validates :venue, presence: true
  validates :date, presence: true
  validates_datetime :date
  


end
