# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) { FactoryBot.build(:project) }
  let(:user) { FactoryBot.create(:user) }
  subject(:create_action) { post :create, 
    params: {user_id: @user.id, 
      project: FactoryBot.attributes_for(:project, 
        user_id: @user.id, 
        format: 'js'), 
      xhr: true} }

  login_user

  context 'with valid attributes' do
    it 'creates a new project' do
      expect{ create_action }.to change{ Project.count }.by(1)
    end
  end
end