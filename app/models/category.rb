class Category < ApplicationRecord
  has_many :adverts
  validates :name, presence: true
end
