# frozen_string_literal: true

# tasks model
class Task < ApplicationRecord
  validates :title, presence: true, format:
    { with: /([A-Za-z0-9\s]){3,15}/, message: 'Only 3-15 character/whitespace title allowed %{value}' }
  belongs_to :project
end
