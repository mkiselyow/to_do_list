# frozen_string_literal: true

# main page controller
class WelcomeController < ApplicationController
  def index
    if current_user
      @projects = current_user.projects
      @task = Task.new
      @project = Project.new
    end
  end
end
