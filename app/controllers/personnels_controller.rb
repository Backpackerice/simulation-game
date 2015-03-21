class PersonnelsController < ApplicationController

  def index
    @personnel = Personnel.all
  end

  def create
    success = true
    Personnel.positions.each do |position|
      personnel = Personnel.find_by(position: position)
      unless personnel.update( personnel_params(position) )
        success = false
      end
    end
    if success
      flash[:success] = "Deine Personaländerungen sind übernommen worden"
    end
    redirect_to action: "index"
  end

  private

  def personnel_params(position)
    params.require(position.to_sym).permit(:salary, :quantity)
  end
end
