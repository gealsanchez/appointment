class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tickets, foreign_key: :customer_id, dependent: :destroy
  has_many :automobiles, through: :tickets

  validates :name, presence: true, uniqueness: true
end
