class Credit < ActiveRecord::Base
  belongs_to :game

  validate :positivity

  def positivity
    if principal < 0 || duration < 0
      record.errors[:base] << "Die Eingaben dürfen nicht negativ sein"
    end
  end

  #set interest rate
  def accumulated_interest
    time_since = Game.current_game.period - period
    acc_interest = 0
    new_principal = principal
    time_since.times do
      acc_interest = new_principal * self.interest_rate
      new_principal = new_principal + (new_principal * self.interest_rate)
    end
    acc_interest
  end

end
