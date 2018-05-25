# frozen_string_literal: true

# projects model
class Project < ApplicationRecord
  validates :title, presence: true, format: { with: /([A-Za-z0-9]){3,10}/, message: 'Only 3-10 character title allowed' }
  belongs_to :user, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
