module Seeder
  ATTR_LIST = {
    :crops => [
                {type: "Wheat", quantity: 2000, unit_value: 1.2, age: 2, periods_since_pesticide: 1},
                {type: "Corn", quantity: 3000, unit_value: 1.5, age: 2, periods_since_pesticide: 1},
                {type: "Oat", quantity: 4000, unit_value: 1.7, age: 3, periods_since_pesticide: 1}
              ],
    :machineries => [
                {type: "Tractor", unit_value: 20000.0, age: 2, periods_since_maintenance: 2},
                {type: "Harvester", unit_value: 1.5, age: 2, periods_since_maintenance: 1}
                ],
    :lifestocks => [
                {type: "Cow", quantity: 150, unit_value: 750.0, age: 2, periods_since_vaccination: 2},
                {type: "Cattle", quantity: 50, unit_value: 500.0, age: 2, periods_since_vaccination: 2},
                {type: "Pig", quantity: 200, unit_value: 450.0, age: 3, periods_since_vaccination: 1}
              ],
}
  def self.initialize_db(user)

    ATTR_LIST.each do |key, params_array|

      params_array.each do |params|
        user.send( key ).create( params )
      end

    end
  end
end
