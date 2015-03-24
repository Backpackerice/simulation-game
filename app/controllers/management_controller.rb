class ManagementController < ApplicationController

  def index
    if game.period == 1
      @current_events = Event.initial_events
    else
      @current_events = Event.recent
    end
      @cash = game.cash
      @crops = current_user.crops.reduce(0) {|sum, machine| sum = sum + machine.unit_value.to_i }
      @lifestocks = current_user.lifestocks.reduce(0) {|sum, machine| sum = sum + machine.unit_value.to_i }
      @machinery = current_user.machineries.reduce(0) {|sum, machine| sum = sum + machine.unit_value.to_i }
      @all_assets = @cash + @crops + @lifestocks + @machinery
      @interest_cost = game.credits.reduce(0){|sum, credit| sum = sum + credit.accumulated_interest }
      @credit_sum = game.credits.reduce(0){|sum, credit| sum = sum + credit.principal }
      @personnel_cost = game.personnels.reduce(0){|sum, personnel| sum = sum + personnel.salary }
      @personnel_count = game.personnels.count
      @harvested_crops = current_user.crops.where.not(harvested: 0).reduce(0){|sum, crop| sum = sum + crop.value }
      @field_crops = current_user.crops.where(harvested: false).reduce(0){|sum, crop| sum = sum + crop.value }
      @assets = @all_assets - @interest_cost - @personnel_cost
      @seeds = @harvested_crops + current_user.crops.where.not(bought: 0).reduce(0){|sum, crop| sum = sum + crop.value }
      @fields = (@field_crops / 1000).to_i
      @machine_occupancy = game.personnels.count / current_user.machineries.count
  end

  def game
    Game.current_game
  end

end
