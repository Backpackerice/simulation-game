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
    interest_due = game.credits.inject(0) do |sum, credit|
      credit.duration = credit.duration -1
      if credit.duration == 0
        credit.destroy!
      else
        credit.save!
      end
      sum += credit.accumulated_interest
      sum
    end

    repayment = game.credits.inject(0) do |sum, credit|
      repay = (credit.principal / installments)
      sum += repay
      sum
    end
    game.cash = game.cash - interest_due
    game.save!
    Event.financial(nil, "Sie mussten in dieser Saison Zinsen über #{interest_due} Euro und eine Rueckzahlung von #{repayment} bezahlen.")
  end

  def adjust_market_price
    #adjust price to crops and meat based on current market price
    #if there was a future for today that becomes the new price
  end

  def simulate_financials

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
