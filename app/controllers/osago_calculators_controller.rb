class OsagoCalculatorsController < ApplicationController
  def new
    @calculator = OsagoCalculator.new
  end

  def create
    calculator = OsagoCalculator.new(calculator_params)
    if calculator.valid?
      calculator.save
      return redirect_to edit_osago_calculator_url(calculator)
    else
      flash[:error] = calculator.errors.full_messages.join(', ')
    end
    redirect_to '/'
  end

  def edit
    @calculator = OsagoCalculator.find(params[:id])
  end

  def update
    @calculator = OsagoCalculator.find(params[:id])
    if @calculator.update_attributes(calculator_params)
      return redirect_to edit_osago_calculator_url(@calculator)
    else
      flash[:error] = calculator.errors.full_messages.join(', ')
    end
    redirect_to '/'
  end

  private

  def calculator_params
    params.require(:osago_calculator).permit(
      :city_id, :drivers_count, :driver_experience, :car_id,
      :car_horse_power_id, :trailer, :with_accidents, :insurance_period,
      :bonus_malun
    )
  end
end
