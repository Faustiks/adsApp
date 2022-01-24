class User < ApplicationRecord
  has_many :comments, through: :adverts
  has_many :adverts
  has_one :role
end
