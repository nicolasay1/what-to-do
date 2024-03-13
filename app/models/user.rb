class User < ApplicationRecord
  has_many :saves, class_name: :Save
  has_many :activities, through: :saves
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships
  has_many :created_groups, class_name: 'group'
  has_many :attendances
  has_one_attached :avatar
  has_many :chatrooms, through: :groups
  has_many :events

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
