class Game < ActiveRecord::Base

  belongs_to :user

  def self.data
    Game.first
  end

  def self.update(args)
    args.keys.each do |attribute|
      self.data[attribute] = args[attribute]
      Game.first.save
    end
  end
end
