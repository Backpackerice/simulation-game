class Lifestock < ActiveRecord::Base

  belongs_to :lifestock
  LIFESTOCK = ["Cow", "Pig", "Cattle"]
  validates_inclusion_of :type, in: LIFESTOCK


  def value
    quantity * unit_value
  end

end
