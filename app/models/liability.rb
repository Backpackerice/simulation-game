class Liability < ActiveRecord::Base
  has_many :personnels
  belongs_to :game
  cattr_accessor :liability_types
  @@liability_types = {machine: "Reparatur, Wartung und sonstige technische Kosten"}

  def salary_changed(change_amount)
    self.amount += change_amount
  end

  def self.update(kind, quantity)
    create(kind: kind, amount: quantity, description: liability_types[kind], game_id: Game.current_game.id )
  end

end
