class Advert < ApplicationRecord
  has_one :user
  has_one :category
  has_many :comments
end
