class Personnel < ActiveRecord::Base
  belongs_to :liability
  belongs_to :game
  cattr_accessor :positions
  @@positions = ["Vertrieb", "Einkauf", "Lagerung", "Produktion"]

  default_scope{ where(game_id: Game.current_game.id) }

  def self.seed_db
    liability = Game.current_game.liabilities.create(kind: "personnel", period: 1, description: "Kummulativen Auslagen für das Gehalt des Personals", amount: 0)
    [{position: "Vertrieb", salary: 15000, quantity: 2, period: 1},
     {position: "Einkauf", salary: 12000, quantity: 2, period: 1},
     {position: "Lagerung", salary: 9000, quantity: 3, period: 1},
     {position: "Produktion", salary: 6000, quantity: 6, period: 1}].each do |params|
      personnel = Game.current_game.personnels.build(params)
      liability.amount = liability.amount + params[:salary]
      personnel.liability = liability
      personnel.save!
    end
    liability.save!
  end

end
