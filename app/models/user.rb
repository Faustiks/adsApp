class User < ApplicationRecord
  has_many :comments, through: :adverts
  has_many :adverts
  has_one :role
  validates :login, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
