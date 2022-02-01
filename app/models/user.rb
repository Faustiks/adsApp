class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  has_many :comments
  # has_many :comments, through: :adverts
  has_many :adverts
  has_one :role
  validates :login, presence: true, length: { minimum: 4 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
            format: {
                with: /[\w\d]+@[\w\d]+\.[\w]+/,
                message: "allows format google2012@gmail.com" }
  validates :phone, presence: true, length: { is: 13 },
            format: {
                with: /(?:\+3)?8?(0\d{9})/,
                message: "phone allow format: +380635290289" }
end
