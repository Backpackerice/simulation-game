class SimulationController < ApplicationController

  def simulate
    update_game_data
    remove_sold_resources
    update_credit
    adjust_market_price
    simulate_technical
    simulate_disease
    simulate_weather
    redirect_to root_path
  end

  def update_game_data
    game.period += 1
    game.set_current_interest_rate
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
    interest_due = game.credits.reduce(0) do |sum, credit|
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
    game.prices.each do |price|
      price.random_change(0.1)
    end
    Event.financial(nil, "Es hat signifikante Preisschwankungen am Markt gegeben gegeben. Insbesondere ist Getreide davon betroffen.")
  end

  def simulate_technical
    machines = current_user.machineries.select do |machine| machine.needs_repair? end
    unless machines.empty?
      place = machines.map(&:to_s).join(", ")
      Event.financial(nil, "Leider müssen die folgenden Maschinen repariert werden #{place}")
    end
  end

  def simulate_disease
    animals = current_user.lifestocks.reduce(0) do |sum, animal|
      sum += animal.number_sick?
      sum
    end
    number = animals.to_i
    Event.financial(nil, "Leider sind #{number} deiner Tiere verstorben.")
  end

  def simulate_weather
    if rand(10) < 3
      crops = current_user.crops.reduce(0) do |sum, crop|
        sum += crop.storm_stricken
        sum
      end
      number = crops.to_i
      Event.financial(nil, "Leider sind #{number} deiner Tiere verstorben.")
    end
  end

  def game
    Game.current_game
  end
  #change global price object
end
