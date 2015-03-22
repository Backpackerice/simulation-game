class SalesController < ApplicationController
  def index
    @crops = current_user.crops
    @lifestock = current_user.lifestocks
  end

  def sell_crops
    Crops.croplist.each do |type|
      crop = current_user.crops.select { |item| item.type == type}
      sold = crop[0].sold + crop_params(type)[:sold].to_i
      harvested = crop[0].harvested - sold
      amount = crop[0].quantity - sold
      crop[0].update!( sold: sold, harvested: harvested, quantity: amount )

      sale_amount = crop[0].sold * crop[0].unit_value
      Event.sales(crop , "Du hast in der letzten Saison Getreide im Wert von #{sale_amount} verkauft. Vergiss nicht neues anzupflanzen." )

      add_to_cash(sale_amount)
    end

    redirect_to action: :index
  end

  def sell_lifestock
    Lifestock.lifestocklist.each do |type|
      lifestock = current_user.lifestocks.select { |item| item.type == type}
      sold = lifestock[0].sold + lifestock_params(type)[:sold].to_i
      butchered = lifestock[0].butchered - sold
      amount = lifestock[0].quantity - sold
      lifestock[0].update!( sold: sold, butchered: butchered, quantity: amount )

      sale_amount = lifestock[0].sold * lifestock[0].unit_value
      Event.sales(lifestock , "Du hast in der letzten Saison Vieh im Wert von #{sale_amount} verkauft. Vergiss nicht neues nachzuzüchten." )

      add_to_cash(sale_amount)
    end

    redirect_to action: :index
  end

  private

  def crop_params(type)
    params.require(type).permit(:sold)
  end

  def lifestock_params(type)
    params.require(type).permit(:sold)
  end

  def add_to_cash(amount)
    cash = Game.current_game.cash
    Game.current_game.cash = cash + amount
    Game.current_game.save!
  end
end
