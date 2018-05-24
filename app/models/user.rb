# frozen_string_literal: true

# user model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :delete_all
  has_many :posts, through: :projects, dependent: :delete_all
end
