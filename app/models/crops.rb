class Crops < ActiveRecord::Base

  belongs_to :user
  cattr_accessor :croplist
  @@croplist = ["Wheat", "Corn", "Oat"]
  validates_inclusion_of :type, in: croplist

  def value
    quantity * unit_value
  end

end
