class StorageController < ApplicationController
  def index
    @crops = current_user.crops
    @lifestock = current_user.lifestocks
    @machinery = current_user.machineries
  end


  def crops
    Crops.croplist.each do |type|
      crop = Crops.find_by(type: type)
      update!()
    end

    render action: :index
  end

  def lifestock
    Lifestock.lifestocklist.each do |type|

    end

    render action: :index
  end

  def machinery
    Machinery.machinerylist.each do |type|
      machine
    end

    render action: :index
  end

  private
  def crop_params(type)
    params.require(type.to_sym).permit(:havest, :spray)
  end

  def lifestock_params(type)
    params.require(type.to_sym).permit(:milk, :butcher, :vaccinate)
  end

  def machinery_params(type)
    params.require(type.to_sym).permit(:repair)
  end

end
