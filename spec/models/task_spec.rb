# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to(:project) }
  it {
    should allow_value(/([A-Za-z0-9\s]){2,15}/).for(:title)
      .with_message('Only 2-15 character/whitespace task title allowed')
  }
end
