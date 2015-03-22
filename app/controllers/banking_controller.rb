class BankingController < ApplicationController

  def index
    @credits = Game.current_game.credits
    @futures = Game.current_game.futures
    @insurances = Game.current_game.insurances
  end

  def amortize

  end

  def futured

  end

  def credit

  end

  def insurance

  end

end
