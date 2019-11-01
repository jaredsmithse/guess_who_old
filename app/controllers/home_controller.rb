class HomeController < ApplicationController
  def index
    if current_employee
      redirect_to new_employee_guess_path(current_employee)
    else
      render layout: 'marketing'
    end
  end
end