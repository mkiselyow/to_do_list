# frozen_string_literal: true

# tasks model
class Task < ApplicationRecord
  default_scope { order("created_at DESC") }
  validates :title, presence: true, format:
    { with: /([A-Za-z0-9\s]){2,15}/, message: 'Only 2-15 character/whitespace task title allowed %{value}' }
  belongs_to :project
end
