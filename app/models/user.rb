class User < ActiveRecord::Base

  has_many :tracks

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password,
            presence: true,
            length: { minimum: 6 }
end