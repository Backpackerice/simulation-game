class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie_for_ng

  private

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_from_forgery?
  end

  def verified_request?
    super || form_authenticity_token ==
    request.headers['HTTP_X_XSRF_TOKEN']
  end

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
