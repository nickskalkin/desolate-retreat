class KaskoCalculator < ActiveRecord::Base
  belongs_to :city
  has_many :drivers
  has_one :automobile

  before_save :calculate_kasko

  accepts_nested_attributes_for :drivers, allow_destroy: true
  accepts_nested_attributes_for :automobile

  BASE_RATE = 5.22
  STEALING_RATE = 0.6

  FRANCHISE_RATE = {
    0 => 1,
    10_000 => 0.91,
    50_000 => 0.81,
    100_000 => 0.71
  }.freeze

  def calculate_kasko
    # Тариф =
    # (Базовый тариф × К (год выпуска/износ) × К (франшиза) × К (возраст/стаж) × К (рассрочка)) +
    # + (Тариф хищения × К (год выпуска/износ) × К (охранная система) × К (рассрочка))
    self.cost_min = base_rate * runout_rate * franchise_rate * common_drivers_rate +
      stealing_rate * runout_rate * automobile_guard_rate
  end

  private

  def base_rate
    (automobile.cost * BASE_RATE).to_f / 100
  end

  def runout_rate
    automobile.runout_rate
  end

  def franchise_rate
    franshise = franshise.to_i
    return FRANCHISE_RATE[0] if franshise < 10_000
    return FRANCHISE_RATE[10_000] if franshise < 50_000
    return FRANCHISE_RATE[50_000] if franshise < 100_000
    FRANCHISE_RATE[100_000]
  end

  def common_drivers_rate
    drivers.map(&:rate).max || 1
  end

  def stealing_rate
    (automobile.cost * STEALING_RATE).to_f / 100
  end

  def automobile_guard_rate
    automobile.guard_rate
  end
end
