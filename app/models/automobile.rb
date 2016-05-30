class Automobile < ActiveRecord::Base
  has_one :kasko_calculator
  has_one :osago_calculator

  RUNOUT_RATE = {
    1990 => 1.3,
    2000 => 1.2,
    2010 => 1.1,
    2015 => 1
  }.freeze

  def runout_rate
    year = year.to_i
    return RUNOUT_RATE[1990] if year < 1990
    return RUNOUT_RATE[2000] if year < 2000
    return RUNOUT_RATE[2010] if year < 2010
    RUNOUT_RATE[2015]
  end

  def guard_rate
    parking_spot_rate * autostart_rate
  end

  def parking_spot_rate
    return 1.2 unless parking_spot
    1
  end

  def autostart_rate
    return 1.1 unless autostart
    1
  end
end
