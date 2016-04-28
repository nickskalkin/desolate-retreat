class MainController < ApplicationController
  def index
    @calculator = OsagoCalculator.new
  end

  def coefficients
  end
end
