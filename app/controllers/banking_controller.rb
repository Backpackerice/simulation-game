class BankingController < ApplicationController

  def index
    @credits = Game.current_game.credits
    @futures = Game.current_game.futures
    @insurances = Game.current_game.insurances
    @market_price = Game.current_game.prices.select(:item_type, :price).reduce({}) do |memo, record|
      key, value = [record.item_type, record.price]
      memo[key] = value
    end
  end

  def amortize

  end

  def future

  end

  def credit

  end

  def insurance

  end

end
