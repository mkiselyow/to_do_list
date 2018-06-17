# frozen_string_literal: true

# main page controller
class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => [:update]
  before_action :correct_user_projects

  def create

    @project = Project.new(project_params)
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.js
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.js
        format.html { redirect_to root_path, notice: 'There was a problem.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit;  end

  def update

    respond_to do |format|
      if @project.update(project_params)
        format.js {}
        format.html { redirect_to root_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.js {}
        format.html { redirect_to root_path, notice: 'There was a problem.' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.fetch(:project, {}).permit(:title, :user_id)
    end

    def correct_user_projects
      if current_user && @project
        unless @project.user == current_user
          flash.now[:alert] = 'You can\'t change project for this project.'
          redirect_to root_path
        end
      end
    end
end
