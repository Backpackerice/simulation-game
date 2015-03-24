class Crops < ActiveRecord::Base

  belongs_to :user
  cattr_accessor :croplist
  @@croplist = ["Wheat", "Corn", "Oat"]
  validates_inclusion_of :type, in: croplist

  def unit_value
    Price.where(item_type: self.type)[0].price.to_i
  end

  def value
    quantity * unit_value
  end

  def storm_stricken
    destroyed = self.quantity * rand(0.1)
    quantity = self.quantity - destroyed
    save!
    destroyed
  end

end
