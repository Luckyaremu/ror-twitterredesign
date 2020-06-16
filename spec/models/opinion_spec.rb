require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Opinion, type: :model do
  describe 'Opinon tests' do
    it { should validate_presence_of(:content) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end
