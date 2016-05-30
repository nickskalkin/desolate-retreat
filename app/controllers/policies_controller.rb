class PoliciesController < ApplicationController
  def new
    @policy_object
    if params[:calculator_type] == 'OsagoCalculator'
      @policy_object = OsagoCalculator.find(params[:calculator_id])
    else
      @policy_object = KaskoCalculator.find(params[:calculator_id])
    end
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
      PolicyMailer.policy_email(policy).deliver_now
      return redirect_to edit_policy_url(policy)
    else
      flash[:error] = policy.errors.full_messages.join(', ')
    end
    redirect_to user_path(current_user)
  end

  def edit
    @policy = Policy.find(params[:id])
  end

  def show
    @policy = Policy.find(params[:id])
  end

  private

  def policy_params
    params
      .require(:policy)
      .permit(:user_id, :policy_object_id, :policy_object_type, :address,
              :fullname, :owner, :auto_id, :gos_znak, :auto_passport_type,
              :auto_passport_serial_number, :auto_passport_number)
  end
end
