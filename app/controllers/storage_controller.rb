class StorageController < ApplicationController
  def index
    @crops = current_user.crops
    @lifestock = current_user.lifestocks
    @machinery = current_user.machineries
  end


  def crops
    Crops.croplist.each do |type|
      crop = current_user.crops.select { |item| item.type == type}
      crop[0].update!( crop_params(type) )

      if crop_params(type)[:sprayed] == "0"
        Event.disease(crop , "Deine Felder wurden in der letzten Saison mit Pestiziden behandelt." )
      end

    end

    redirect_to action: :index
  end

  def lifestock
    Lifestock.lifestocklist.each do |type|
      life = current_user.lifestocks.select { |item| item.type == type}
      life[0].update!( lifestock_params(type) )

      if lifestock_params(type)[:vaccinated] == "0"
        Event.disease(life , "Dein Vieh wurde in der letzten Saison geimpft." )
      end

    end

    redirect_to action: :index
  end

  def machinery
    Machinery.machinerylist.each do |type|
      machine = Machinery.find_by(id: machinery_params(type)[:id])
      binding.pry
      if machinery_params(type).has_key?(:repair)
        machine.periods_since_maintenance = 0
      end
      machine.save!

      Liability.update(:machine, 1000)
      subtract_cash(1000)
      binding.pry
      Event.technical(machine)
    end

    redirect_to action: :index
  end

  private
  def crop_params(type)
    params.require(type.to_sym).permit(:harvested, :sprayed)
  end

  def lifestock_params(type)
    params.require(type.to_sym).permit(:milk, :butchered, :vaccinated)
  end

  def machinery_params(type)
    params.require(type).permit(:repair, :id)
  end

  def game
    Game.current_game
  end

  def subtract_cash(amount)
    cash = Game.current_game.cash
    Game.current_game.cash = cash - amount
    Game.current_game.save!
  end

end
