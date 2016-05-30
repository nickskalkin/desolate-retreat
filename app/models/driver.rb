class Driver < ActiveRecord::Base
  belongs_to :kasko_calculator
  belongs_to :osago_calculator

  enum gender: {
    male: 0,
    female: 1
  }

  EXPERIENCE_RATE = {
    1 => 1.5,
    2 => 1.4,
    4 => 1.3,
    6 => 1.2,
    8 => 1.1,
    10 => 1
  }.freeze

  def rate
    experience_rate * gender_rate * childrens_rate * marriage_rate
  end

  def experience_rate
    experience = experience.to_i
    return EXPERIENCE_RATE[1] if experience < 1
    return EXPERIENCE_RATE[2] if experience < 2
    return EXPERIENCE_RATE[4] if experience < 4
    return EXPERIENCE_RATE[6] if experience < 6
    return EXPERIENCE_RATE[8] if experience < 8
    EXPERIENCE_RATE[10]
  end

  def gender_rate
    return 1 if gender == 0
    0.9
  end

  def childrens_rate
    childrens ? 0.8 : 1
  end

  def marriage_rate
    marriage ? 0.8 : 1
  end
end
