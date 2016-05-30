class KaskoCalculatorsController < ApplicationController
  def new
    @calculator = KaskoCalculator.new
    @calculator.drivers.build
    @calculator.build_automobile
  end

  def create
    calculator = KaskoCalculator.new(calculator_params)
    if calculator.valid?
      calculator.save
      return redirect_to edit_kasko_calculator_url(calculator)
    else
      flash[:error] = calculator.errors.full_messages.join(', ')
    end
    redirect_to '/'
  end

  def edit
    @calculator = KaskoCalculator.find(params[:id])
  end

  def update
    @calculator = KaskoCalculator.find(params[:id])
    if @calculator.update_attributes(calculator_params)
      return redirect_to edit_kasko_calculator_url(@calculator)
    else
      flash[:error] = calculator.errors.full_messages.join(', ')
    end
    redirect_to '/'
  end

  private

  def calculator_params
    params.require(:kasko_calculator).permit(
      :city_id, :franchise,
      drivers_attributes: [
        :id, :age, :experience, :gender, :childrens, :marriage, :_destroy
      ],
      automobile_attributes: [
        :id, :brand, :model, :year, :engine, :parking_spot, :autostart, :cost
      ]
    )
  end
end
