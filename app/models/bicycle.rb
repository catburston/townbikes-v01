class Bicycle < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :transactions
end