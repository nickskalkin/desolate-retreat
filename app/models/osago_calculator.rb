class OsagoCalculator < ActiveRecord::Base
  belongs_to :city
  belongs_to :car
  belongs_to :car_horse_power

  enum drivers_count: {
    drivers_limited: 0,
    drivers_not_limited: 1
  }

  enum driver_experience: {
    not_setted_up: 0,
    yonger22less3: 1,
    yonger22more3: 2,
    older22less3:  3,
    older22more3:  4
  }

  enum insurance_period: {
    m3: 0, m4: 1, m5: 2,
    m6: 3, m7: 4, m8: 5,
    m9: 6, b9: 7
  }

  DRIVERS_LIMITED_RATE = 1
  DRIVERS_NOT_LIMITED_RATE = 1.8

  DRIVER_EXPERIENCE_RATIO = {
    'not_setted_up' => 1,
    'yonger22less3' => 1.8,
    'yonger22more3' => 1.6,
    'older22less3'  => 1.7,
    'older22more3'  => 1.0
  }.freeze

  INSURANCE_PERIOD_RATIO = {
    'm3' => 0.5, 'm4' => 0.6, 'm5' => 0.65,
    'm6' => 0.7, 'm7' => 0.8, 'm8' => 0.9,
    'm9' => 0.95, 'b9' => 1
  }.freeze

  WITHOUT_ACCIDENTS_RATE = 1
  WITH_ACCIDENTS_RATE = 1.5

  before_save :calculate_osago

  private

  def calculate_osago
    self.cost = base_rate * city_rate * drivers_count_rate * drivers_experience_rate *
                car_horse_power_rate * accidents_rate * insurance_period_rate
  end

  def base_rate
    car.rate + trailer_rate
  end

  def trailer_rate
    return 0 unless trailer
    Car::TRAILER_CATEGORY_RATIO[car.trailer_category]
  end

  def city_rate
    car.tractor? ? city.tractor_rate : city.car_rate
  end

  def drivers_count_rate
    drivers_limited? ? DRIVERS_LIMITED_RATE : DRIVERS_NOT_LIMITED_RATE
  end

  def drivers_experience_rate
    DRIVER_EXPERIENCE_RATIO[driver_experience]
  end

  def car_horse_power_rate
    car_horse_power.rate
  end

  def accidents_rate
    with_accidents? ? WITH_ACCIDENTS_RATE : WITHOUT_ACCIDENTS_RATE
  end

  def insurance_period_rate
    INSURANCE_PERIOD_RATIO[insurance_period]
  end
end
