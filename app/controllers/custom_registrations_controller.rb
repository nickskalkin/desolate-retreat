class CustomRegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    new_policy_path(calculator_id: params[:calculator_id], calculator_type: params[:@calculator_type])
  end
end
