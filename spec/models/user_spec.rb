# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should have_many(:projects) }
  it { should have_many(:tasks).through(:projects) }
end
