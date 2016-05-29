class CustomSessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    new_policy_path(calculation_id: params[:osago_id])
  end
end
