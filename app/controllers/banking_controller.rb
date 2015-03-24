class BankingController < ApplicationController

  def index
    @credits = game.credits
    @futures = game.futures
    @insurances = game.insurances.where.not(quantity: nil)
    @market_price = game.prices.inject({}) do |memo, record|
      key, value = [record.item_type, record.price]
      memo[key] = value
      memo
    end

    @insurance_price = game.insurances.inject({}) do |memo, record|
      key, value = [record.item, record.price_per_item]
      memo[key] = value
      memo
    end

  end

  def amortize
    credit = Credit.find_by(id: amortization_params[:id])
    subtract_from_cash(credit.principal + credit.accumulated_interest)
    Event.financial(credit, "Du hast in der letzten Saison einen Kredit über #{view_context.number_to_currency(credit.principal, unit: '€')} abbezahlt.")
    credit.destroy!

    redirect_to action: 'index'
  end

  def future
    future = game.futures.create(future_params)

    Liability.update(:future, "Terminvertrag für #{future.item} zum Preis #{view_context.number_to_currency(future.price_per_item, unit: '€')}")
    Event.financial(future, "Du hast in der letzten Saison einen Terminvertrag für #{future.item} zum Preis #{view_context.number_to_currency(future.price_per_item, unit: '€')} abgeschlossen")

    redirect_to action: 'index'
  end

  def credit
    credit = game.credits.create(credit_params)

    Liability.update(:credit, "Kredit über #{view_context.number_to_currency(credit.principal, unit: '€')}")
    Event.financial(credit, "Du hast in der letzten Saison einen Kredit über #{view_context.number_to_currency(credit.principal, unit: '€')} aufgenommen.")
    add_to_cash(credit.principal)

    redirect_to action: 'index'
  end

  def insurance
    insurance = game.insurances.create(insurance_params)

    Liability.update(:insurance, "Versicherung für #{insurance.item} zum Preis #{view_context.number_to_currency(insurance.price_per_item, unit: '€')}")
    Event.financial(insurance, "Du hast in der letzten Saison einen Terminvertrag für #{insurance.item} zum Preis #{view_context.number_to_currency(insurance.price_per_item, unit: '€')} abgeschlossen")

    redirect_to action: 'index'
  end

  private

  def game
    Game.current_game
  end

  def credit_params
    parameters = params.require(:credit).permit(:principal, :duration, :installments)
    parameters.merge!({period: game.period})
  end

  def insurance_params
    params.require(:insurance).permit(:item, :price_per_item, :quantity)
    parameters.merge!({period: game.period})
  end

  def future_params
    params.require(:future).permit(:contractual_item, :price, :settlement_period, :quantity)
    parameters.merge!({period: game.period})
  end

  def amortization_params
    params.require(:credit).permit(:id)
  end

  def add_to_cash(amount)
    cash = Game.current_game.cash
    Game.current_game.cash = cash + amount
    Game.current_game.save!
  end

  def subtract_from_cash(amount)
    cash = Game.current_game.cash
    Game.current_game.cash = cash - amount
    Game.current_game.save!
  end
end
