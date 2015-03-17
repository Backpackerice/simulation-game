class Liability < ActiveRecord::Base
  has_many :personnels
  belongs_to :game
end
