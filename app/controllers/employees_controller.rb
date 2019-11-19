# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :authenticate_employee!

  def edit
  end

  def update
    @employee = current_employee
    @employee.update(employee_params)
    
    if @employee.errors.none?
      redirect_to(
        new_employee_guess_url(current_employee), 
        flash: { success: "Successfully updated profile" },
      )
    else
      flash[:error] = "There was a problem with your info"
      render :edit
    end
  end

  private def employee_params
    params.
      require(:employee).
      permit(:name, :email, :location_id, :department_id, :position_id, :team_id)
  end
end