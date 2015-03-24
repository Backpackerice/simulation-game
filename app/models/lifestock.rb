class Lifestock < ActiveRecord::Base

  belongs_to :user
  cattr_accessor :lifestocklist
  @@lifestocklist = ["Cow", "Pig", "Cattle"]
  validates_inclusion_of :type, in: lifestocklist

  def unit_value
   Price.where(item_type: self.type)[0].price.to_i
  end

  def value
    quantity * unit_value
  end

end
