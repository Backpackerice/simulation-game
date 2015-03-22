class Game < ActiveRecord::Base

  belongs_to :user
  has_many :events
  has_many :liabilities
  has_many :assets
  has_many :personnels
  has_many :futures
  has_many :insurances
  has_many :credits
  cattr_accessor :current_game

  def next_period
    self.period + 1
  end

end
