class PoliciesController < ApplicationController
  def new
    @policy_object = OsagoCalculator.find(params[:calculation_id])
    @policy = Policy.new(
      policy_object_id: @policy_object.id,
      policy_object_type: @policy_object.class,
      user_id: current_user.id
    )
  end

  def create
    policy = Policy.new(policy_params)
    if policy.valid?
      policy.save
      return redirect_to edit_policy_url(policy)
    else
      flash[:error] = policy.errors.full_messages.join(', ')
    end
    redirect_to user_path(current_user)
  end

  def edit
    @policy = Policy.find(params[:id])
  end

  private

  def policy_params
    params
      .require(:policy)
      .permit(:user_id, :policy_object_id, :policy_object_type, :address)
  end
end
