module Seeder
  USER_ATTR_LIST = {
    :crops => [
                {type: "Wheat", quantity: 2000, age: 2, sprayed: 0},
                {type: "Corn", quantity: 3000,  age: 2, sprayed: 0},
                {type: "Oat", quantity: 4000, age: 3, sprayed: 0}
              ],
    :machineries => [
                {type: "Tractor", age: 2, periods_since_maintenance: 2},
                {type: "Harvester", age: 2, periods_since_maintenance: 1}
                ],
    :lifestocks => [
                {type: "Cow", quantity: 150, age: 2, vaccinated: 0},
                {type: "Cattle", quantity: 50, age: 2, vaccinated: 0},
                {type: "Pig", quantity: 200, age: 3, vaccinated: 0}
              ],
}

  PERSONELL_ATTRIBUTES_LIST = [
     {position: "Vertrieb", salary: 15000, quantity: 2, period: 1},
     {position: "Einkauf", salary: 12000, quantity: 2, period: 1},
     {position: "Lagerung", salary: 9000, quantity: 3, period: 1},
     {position: "Produktion", salary: 6000, quantity: 6, period: 1}
   ]

  def self.initialize_db(user)

    USER_ATTR_LIST.each do |key, params_array|
      params_array.each do |params|
        user.send( key ).create( params )
      end

    end

    liability = Game.current_game.liabilities.create(kind: "personnel", period: 1, description: "Kummulativen Auslagen für das Gehalt des Personals", amount: 0)
    PERSONELL_ATTRIBUTES_LIST.each do |params|
      personnel = Game.current_game.personnels.build(params)
      liability.amount = liability.amount + params[:salary]
      personnel.liability = liability
      personnel.save!
    end
    liability.save!

    {"Wheat" => 1.5 , "Corn" => 1.2 , "Oat" => 1.1 , "Tractor" => 15000, "Harvester" => 20000, "Cow" => 750.0, "Cattle" => 500.0, "Pig" => 450.0}.each do |key, val|
      Price.create(item_type: key, game_id: Game.current_game.id, price: val)
    end

    {"Wheat" => 0.1 , "Corn" => 0.2 , "Oat" => 0.1 , "Tractor" => 500, "Harvester" => 700, "Cow" => 50.0, "Cattle" => 50.0, "Pig" => 45.0}.each do |key, val|
      Insurance.create(item: key, game_id: Game.current_game.id, price_per_item: val, period: Game.current_game.period)
    end

  end

end
