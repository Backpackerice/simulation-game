class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # should ideally be done in the background however we only have one dyn on heroku
  after_create :setup_game

  has_one :game
  has_many :crops, class_name: "Crops"
  has_many :lifestocks
  has_many :machineries

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  private

  def setup_game
    game = Game.create(user_id: self.id, period: 1, cash: 50000.00)
    Game.current_game = game
    ::Seeder.initialize_db(self)
  end

end
