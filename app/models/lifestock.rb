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

  def number_sick?
    deceased = 0
    if self.vaccinated != 0
      deceased = (self.quantity / self.vaccinated) * rand(0.1) * self.quantity
    else
      deceased = ((quantity * 2) * rand(0.1)).to_i
    end
    self.quantity = self.quantity - deceased
    save!
    deceased
  end

end
