class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  validates :email, uniqueness: true, presence: true
  validates :first_name, uniqueness: false, presence: true
  validates :second_name, uniqueness: false, presence: true

  has_many :posts, dependent: :destroy
end
