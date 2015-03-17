class ManagementController < ApplicationController

  def index
    if Game.current_game.period == 1
      @current_events = Event.initial_events
    else
      @current_events = Event.recent
    end
  end

  def spray

  end

  def harvest

  end

  def butcher

  end

  def milk

  end

  def maintain

  end
end
