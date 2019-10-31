class Employees::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @employee = Employee.from_omniauth(request.env["omniauth.auth"])
    debugger
    if @employee.persisted?
      sign_in @employee, event: :authentication
      set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
    end
    redirect_to '/'
  end
end