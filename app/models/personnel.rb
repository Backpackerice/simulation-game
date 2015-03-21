class Personnel < ActiveRecord::Base
  belongs_to :liability
  belongs_to :game
  after_update :update_liability
  cattr_accessor :positions

  @@positions = ["Vertrieb", "Einkauf", "Lagerung", "Produktion"]

  default_scope{ where(game_id: Game.current_game.id) }

  def satisfaction
    case position
    when "Vertrieb"
      if weighted_sum >= 12000 && weighted_sum < 20000
        "indifferent"
      elsif weighted_sum < 12000
        "sad"
      else
        "happy"
      end
    when "Einkauf"
      if weighted_sum >= 10000 && weighted_sum < 15000
        "indifferent"
      elsif weighted_sum < 10000
        "sad"
      else
        "happy"
      end
    when "Lagerung"
      if weighted_sum >= 11000 && weighted_sum < 15000
        "indifferent"
      elsif weighted_sum < 11000
        "sad"
      else
        "happy"
      end
    when "Produktion"
      if weighted_sum >= 15000 && weighted_sum < 20000
        "indifferent"
      elsif weighted_sum < 15000
        "sad"
      else
        "happy"
      end
    end
  end

  private

  def update_liability
    change_amount = salary - salary_was
    liability.salary_changed(change_amount)
  end

  def weighted_sum
    (salary * quantity) / 2
  end

end
