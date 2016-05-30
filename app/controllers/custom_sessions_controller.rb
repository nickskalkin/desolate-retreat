class CustomSessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    new_policy_path(calculator_id: params[:calculator_id], calculator_type: params[:@calculator_type])
  end
end
