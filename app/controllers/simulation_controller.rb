class SimulationController < ApplicationController

  def update_game_data
    #increase period
    # update interestrate
    Game.current_game.period += 1
    Game.current_game.period.set_current_interest_rate
  end

  def remove_sold_resources
    #
  end

  def update_credit
    #increase interest
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

  #change global price object
end
