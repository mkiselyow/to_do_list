# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should have_many(:projects) }
  it { should have_many(:tasks).through(:projects) }

  describe 'user creation' do
    it 'increases total users count' do
      current_users_quantity = described_class.all.count
      password = 'foobarfoobar'
      @user1 = create(
        :user,
        password: password,
        password_confirmation: password
      )
      expect(described_class.all.count).to eq(current_users_quantity + 1)
    end
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
