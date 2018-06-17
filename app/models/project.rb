# frozen_string_literal: true

# projects model
class Project < ApplicationRecord
  default_scope { order(created_at: :desc) }
  validates :title, presence: true, format:
    { with: /([A-Za-z0-9\s]){2,15}/, message: 'Only 2-15 character/whitespace project title allowed %{value}' }
  belongs_to :user
  has_many :tasks, dependent: :destroy
end
