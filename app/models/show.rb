class Show < ApplicationRecord
  #attr_accessor :date
  default_scope -> { order(:date) }
  validates :venue, presence: true
  validates :date, presence: true
  validates_datetime :date
  
# def count_after_today
#   Show.find_each do |show|
#     if show.date >= DateTime.now()
#       return show
#     end 
# end




end
