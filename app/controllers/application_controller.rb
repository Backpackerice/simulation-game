class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  #around filter
  # around_action :wrap_application
  #
  # def wrap_application
  #   update_game_data
  #   simulate_risk
  #   yield
  #   process_events
  # end
  #
  # # returns an instance of the singleton queue
  # def get_queue
  #   Queue.instance
  # end
  # helper_method :get_queue
  #
  # private
  #   def update_game_data
  #     # increase number of turns and Date
  #   end
  #
  #   def simulate_risks
  #     # run monte carlo simulation
  #   end
  #
  #   def process_events
  #     threads = []
  #     5.times do
  #       threads << Thread.new do
  #         while event = get_queue.pop
  #           Worker.new.process(event)
  #         end
  #       end
  #     end
  #     threads.each {|thr| thr.join}
  #     #while events in qeue
  #   end

end
