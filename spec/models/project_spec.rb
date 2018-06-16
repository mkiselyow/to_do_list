# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should allow_value(/([A-Za-z0-9\s]){2,15}/).for(:title)
      .with_message('Only 2-15 character/whitespace project title allowed')}
  it { should belong_to(:user) }
  it { should have_many(:tasks) }
end
