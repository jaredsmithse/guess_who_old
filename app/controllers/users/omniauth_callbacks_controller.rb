# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @employee = Employee.from_omniauth(request.env["omniauth.auth"])
      sign_in @employee, event: :authentication
      redirect_to new_employee_guess_path(@employee)
    end
  end
end
