class WelcomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
  end

  def dashboard
  end

  def choose_layout
    user_signed_in? ? "angular" : "application"
  end

end
