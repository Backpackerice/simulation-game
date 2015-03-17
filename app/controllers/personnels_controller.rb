class PersonnelsController < ApplicationController
  def index
    if Game.current_game.period == 1
      Personnel.seed_db
      @personnel = Personnel.all
    else
      @personnel = Personnel.all
    end
  end

  def create
    binding.pry
    flash[:success] = "Du hast neue Angestellte eingestellt: Anzahl: #{quant}"
    redirect_to index
  end


  private
  def personnel_params
    params.require(:person).permit(:salary, :quantity)
  end


end
