class ManagementController < ApplicationController

  def index
    @crops = current_user.crops
    @machinery = current_user.machineries
    @lifestock = current_user.lifestocks
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
