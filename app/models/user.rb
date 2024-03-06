class User < ApplicationRecord
  has_many :saves
  has_many :activities, through: :saves
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :created_groups, class_name: 'group'
  has_many :attendances
  has_many :likes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
