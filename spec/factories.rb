# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  sequence :email do |_n|
    Faker::Internet.unique.email
  end

  factory :project, class: 'Project' do
    title { Faker::Job.field.truncate(14) }
    association :user
  end

  factory :project_with_tasks, class: 'Project' do
    title {Faker::Job.field.truncate(14)}
    association :user
    after :create do |project_with_tasks|
      create_list :task, 3, project: project_with_tasks
    end
  end

  factory :task, class: 'Task' do
    title {Faker::Job.key_skill.truncate(14)}
    status {Faker::Boolean.boolean}
    deadline {Faker::Date.between(2.days.ago, Date.today)}
    association :project
  end

  factory :user, class: 'User' do
    email
    password '12345678'
  end

  factory :user_with_projects_tasks, class: 'User' do
    email
    password '12345678'
    after :create do |user_with_projects_tasks|
      create_list :project_with_tasks, 3, user: user_with_projects_tasks
    end
  end
end
