class TradesController < ApplicationController

  def index
    @crops = current_user.crops
    @lifestock = current_user.lifestocks
  end

  def buy_crops
    Crops.croplist.each do |type|
      crop = current_user.crops.select { |item| item.type == type}
      bought = crop[0].bought + crop_params(type)[:bought].to_i
      amount = crop[0].quantity + bought
      crop[0].update!( bought: bought, quantity: amount )

      buy_amount = crop[0].bought * crop[0].unit_value
      Event.sales(crop , "Du hast in der letzten Saison Saatgut im Wert von #{buy_amount} gerkauft." )

      subtract_from_cash(buy_amount)
    end

    redirect_to action: :index
  end

  def buy_lifestock
    Lifestock.lifestocklist.each do |type|
      lifestock = current_user.lifestocks.select { |item| item.type == type}
      bought = lifestock[0].bought + lifestock_params(type)[:bought].to_i
      amount = lifestock[0].quantity - bought
      lifestock[0].update!( bought: bought, butchered: butchered, quantity: amount )

      buy_amount = lifestock[0].bought * lifestock[0].unit_value
      Event.sales(lifestock , "Du hast in der letzten Saison Zuchtvieh im Wert von #{buy_amount} gekauft." )

      subtract_from_cash(buy_amount)
    end

    redirect_to action: :index
  end


  private
  def crop_params(type)
    params.require(type).permit(:bought)
  end

  def lifestock_params(type)
    params.require(type).permit(:bought)
  end

  def subtract_from_cash(amount)
    cash = Game.current_game.cash
    Game.current_game.cash = cash - amount
    Game.current_game.save!
  end
end
