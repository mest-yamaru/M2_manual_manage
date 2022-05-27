class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    Employee.find_or_create_by(email: "guest@example.com") do |employee|
      employee.password = SecureRandom.urlsafe_base64
        # employee.confirmed_ad = Time.now
    end
  end

end
