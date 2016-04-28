class Car < ActiveRecord::Base
  enum trailer_category: {
    car: 0,
    truck: 1
  }

  TRAILER_CATEGORY_RATIO = {
    'car' => 305,
    'truck' => 810
  }.freeze
end
