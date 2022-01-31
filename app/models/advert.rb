class Advert < ApplicationRecord
  has_one :user
  has_one :category
  has_many :comments
  validates :category_id, presence: true
  validates :title, presence: true, length: { minimum: 4 }
  validate :text, presence: true
  # attr_accessor :title, :image, :description, :text, :created_at, :updated_at
  # def as_json(options = {}){
  #     username: user_id,
  #     title: title,
  #     description: description,
  #     text: text,
  #     created_at: created_at,
  #     updated_at: updated_at
  #   }
  # end
end
