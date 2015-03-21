class Crops < ActiveRecord::Base

  belongs_to :user
  cattr_accessor :croplist
  @@croplist = ["Wheat", "Corn", "Oat"]
  validates_inclusion_of :type, in: croplist

  scope :sprayed, ->(type) { where(:type => type, :periods_since_pesticide => 0)}
  def value
    quantity * unit_value
  end

end
