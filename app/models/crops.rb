class Crops < ActiveRecord::Base

  belongs_to :user

  CROPS = ["Wheat", "Corn", "Oat"]
  validates_inclusion_of :type, in: CROPS


  def value
    quantity * unit_value
  end

end
