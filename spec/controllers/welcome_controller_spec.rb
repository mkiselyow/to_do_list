# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'GET #index' do

    login_user

    it "renders the :index template" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "welcome",
        action: "index")
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns @projects when current_user" do
      FactoryBot.create_list(:project_with_tasks, 2, user: @user)
      get :index
      expect(assigns(:projects)).to eq(@user.projects)
    end

    it "assigns @project when current_user" do
      get :index
      expect(assigns(:project)).not_to eq(nil)
    end

    it "assigns @task when current_user" do
      get :index
      expect(assigns(:task)).not_to eq(nil)
    end
  end
end