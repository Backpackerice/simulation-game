class Liability < ActiveRecord::Base
  has_many :personnels
  belongs_to :game

  def salary_changed(change_amount)
    self.amount += change_amount
  end
end
