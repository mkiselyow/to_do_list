# frozen_string_literal: true

# main page controller
class WelcomeController < ApplicationController
  def index
    @projects = Project.all
    @task = Task.new
  end
end
