class Game < ActiveRecord::Base

  belongs_to :user
  has_many :events
  has_many :liabilities
  has_many :assets
  has_many :personnels

  cattr_accessor :current_game
end
