class Policy < ActiveRecord::Base
  belongs_to :user

  def serial_number
    'EEE'
  end

  def number
    sprintf("%010d", id)
  end

  def policy_type
    if policy_object_type == 'OsagoCalculator'
      'ОСАГО'
    else
      'КАСКО'
    end
  end
end
