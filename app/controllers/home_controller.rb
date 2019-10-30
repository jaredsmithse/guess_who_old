class HomeController < ApplicationController
  before_action :authenticate_employee!

  def index
    @guess_service = GuessService.new(current_employee)
  end
end