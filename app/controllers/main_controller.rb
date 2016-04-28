class MainController < ApplicationController
  def index
    @calculator = OsagoCalculator.new
  end
end
