require_relative '../../db/config'

class Student < ActiveRecord::Base

  validates :email, :uniqueness => true,
            :format => {:with => /.+@.+\..{2,}/,
            :message => "Invalid email"}

  validates :age, :numericality => {greater_than: 5}

  validates :phone, format: {with: /.{10}/, message: 'Beep!'}

  def name
    "#{first_name} #{last_name}"
  end

  def age
    Time.now.year.to_i - birthday.year.to_i
  end
end

