# frozen_string_literal: true

# main page controller
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:update]
  # before_action :correct_user_tasks

  def create
    p params
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.js
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.js
        format.html { redirect_to root_path, notice: 'There was a problem.' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    p params
    respond_to do |format|
      if @task.update(task_params) && params[:cancel] == nil
        format.js {}
        format.html { redirect_to root_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.js {}
        format.html { redirect_to root_path, notice: 'There was a problem.' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.fetch(:task, {}).permit(:title, :status, :deadline, :action, :project_id)
    end

    def correct_user_tasks
      if current_user && @task
        unless @task.project.user == current_user
          flash.now[:alert] = 'You can\'t change task for this project.'
          redirect_to root_path
        end
      end
    end
end
