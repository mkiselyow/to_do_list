# frozen_string_literal: true

require 'faker'

User.all.each(&:destroy)
Project.all.each(&:destroy)
Task.all.each(&:destroy)
FactoryBot.create_list(:user_with_projects_tasks, 5)
