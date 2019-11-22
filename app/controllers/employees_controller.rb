# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @employees = current_employee.company.employees
  end

  def edit; end

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
      permit(:name, :email, :location_id, :left_at, :custom_profile_photo, :about_me)
  end
end
