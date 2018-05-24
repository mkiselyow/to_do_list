# frozen_string_literal: true

# tasks model
class Task < ApplicationRecord
  validates :title, presence: true, format:
    { with: /([A-Za-z0-9]){3,10}/, message: 'Only 3-10 character title allowed' }
  belongs_to :project
  belongs_to :user
end
