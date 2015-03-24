class Price < ActiveRecord::Base
  belongs_to :game

  def random_change(change)
    if !self.price?.nil?
      if rand(10).floor > 5
        price_new = self.price - rand(change)*(self.price)
        unless price_new < 0
          self.price = price_new
        end
      else
        self.price = price + rand(change)*price
      end
      save!
    end
  end

end
