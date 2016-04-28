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

  DRIVERS_LIMITED_RATE = 1
  DRIVERS_NOT_LIMITED_RATE = 1.8

  DRIVER_EXPERIENCE_RATIO = {
    'not_setted_up' => 1,
    'yonger22less3' => 1.8,
    'yonger22more3' => 1.6,
    'older22less3'  => 1.7,
    'older22more3'  => 1.0
  }.freeze

  before_save :calculate_osago

  private

  def calculate_osago
    self.cost = base_rate * city_rate * drivers_count_rate * drivers_experience_rate *
                car_horse_power_rate
  end

  def base_rate
    car.rate
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
end
