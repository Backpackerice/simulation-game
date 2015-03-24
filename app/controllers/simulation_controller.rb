class SimulationController < ApplicationController

  def update_game_data
    #increase period
    # update interestrate
    Game.current_game.period += 1
    Game.current_game.period.set_current_interest_rate
  end

  def remove_sold_resources
    current_user.crops.map do |crop|
      crop.quantity += crop.bought + crop.sold
      crop.bought = 0
      crop.sold = 0
      crop.save!
    end

    current_user.lifestocks.map do |animal|
      animal.quantity += animal.bought + animal.sold
      animal.bought = 0
      animal.sold = 0
      animal.save!
    end
  end

  def update_credit

    # pay credit period / installments
    # reduce duration
  end

  def adjust_market_price
    #adjust price to crops and meat based on current market price
    #if there was a future for today that becomes the new price
  end

  def simulate_financials
    # zinsen
    # preise
  end

  def simulate_technical

  end

  def simulate_disease

  end

  def simulate_weather

  end

  def game
    Game.current_game
  end
  #change global price object
end
