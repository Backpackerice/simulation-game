class Machinery < ActiveRecord::Base

  belongs_to :user
  MACHINERY = ["Tractor", "Harvester"]
  validates_inclusion_of :type, in: MACHINERY

  alias_attribute :value, :unit_value
end
