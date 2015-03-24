class Game < ActiveRecord::Base

  belongs_to :user
  has_many :events
  has_many :liabilities
  has_many :assets
  has_many :personnels
  has_many :futures
  has_many :insurances
  has_many :credits
  has_many :prices
  cattr_accessor :current_game

  def next_period
    self.period + 1
  end

  def set_current_interest_rate
    response = Net::HTTP.get_response(URI.parse("https://sdw-wsrest.ecb.europa.eu/service/data/MIR/M.U2.B.A2I.AM.R.A.2240.EUR.N?lastNObservations=1"))
    interest_rate = Nokogiri::XML(response.body).xpath("//generic:Obs/generic:ObsValue")[0].attributes["value"].value.to_f
    binding.pry
    self.interest = interest_rate
    save!
  end

end
