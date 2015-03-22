module Seeder
  USER_ATTR_LIST = {
    :crops => [
                {type: "Wheat", quantity: 2000, unit_value: 1.2, age: 2, sprayed: 0},
                {type: "Corn", quantity: 3000, unit_value: 1.5, age: 2, sprayed: 0},
                {type: "Oat", quantity: 4000, unit_value: 1.7, age: 3, sprayed: 0}
              ],
    :machineries => [
                {type: "Tractor", unit_value: 20000.0, age: 2, periods_since_maintenance: 2},
                {type: "Harvester", unit_value: 15000.0, age: 2, periods_since_maintenance: 1}
                ],
    :lifestocks => [
                {type: "Cow", quantity: 150, unit_value: 750.0, age: 2, vaccinated: 0},
                {type: "Cattle", quantity: 50, unit_value: 500.0, age: 2, vaccinated: 0},
                {type: "Pig", quantity: 200, unit_value: 450.0, age: 3, vaccinated: 0}
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
    binding.pry
    liability = Game.current_game.liabilities.create(kind: "personnel", period: 1, description: "Kummulativen Auslagen für das Gehalt des Personals", amount: 0)
    PERSONELL_ATTRIBUTES_LIST.each do |params|
      personnel = Game.current_game.personnels.build(params)
      liability.amount = liability.amount + params[:salary]
      personnel.liability = liability
      personnel.save!
    end
    liability.save!
  end
end
