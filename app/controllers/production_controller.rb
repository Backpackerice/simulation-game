class ProductionController < ApplicationController
  def index
    @crops = current_user.crops
    @lifestock = current_user.lifestocks
  end

  def sow_crops
    Crops.croplist.each do |type|
      crop = current_user.crops.select { |item| item.type == type}
      amount = crop[0].quantity + crop_params(type)[:sow].to_i
      if amount > 0
        crop[0].update!( quantity: amount, age: 0 )
      end
      cost = crop[0].unit_value * amount
      subtract_cash(cost)
    end

    redirect_to action: :index

  end

  def breed_lifestock
    Lifestock.lifestocklist.each do |type|
      lifestock = current_user.lifestocks.select { |item| item.type == type}
      amount = lifestock[0].quantity + lifestock_params(type)[:breed].to_i
      if amount > 0
        lifestock[0].update!( quantity: amount, age: 0 )
      end
      cost = (lifestock[0].unit_value/3) * amount
      subtract_cash(cost)
    end

    redirect_to action: :index
  end

  def crop_params(type)
    params.require(type).permit(:sow)
  end

  def lifestock_params(type)
    params.require(type).permit(:breed)
  end

  def subtract_cash(amount)
    cash = Game.current_game.cash
    Game.current_game.cash = cash - amount
    Game.current_game.save!
  end

end
