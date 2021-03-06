require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  describe 'User account creation with valid credentials' do
    it 'validates user first names' do
      user = User.new(id: 4, last_name: 'lucky', email: 'aremu@gmail.com', password: 'passsing')
      expect(user).not_to be_valid
    end

    it 'First names should not be blank and not too short' do
      user = User.new(id: 4, last_name: 'aremu', email: 'aremu@gmail.com', password: 'passsing')
      user.save
      expect(user.errors.full_messages).to eq(["First names can't be blank",
                                               'First names is too short (minimum is 3 characters)'])
    end

    it 'validates user last name' do
      user = User.new(id: 4, first_names: 'aremu', email: 'aremu@gmail.com', password: 'passsing')
      expect(user).not_to be_valid
    end

    it 'last name should not be blank and not too short' do
      user = User.new(id: 4, first_names: 'lucky', email: 'aremu@gmail.com', password: 'passsing')
      user.save
      expect(user.errors.full_messages).to eq(["Last name can't be blank",
                                               'Last name is too short (minimum is 3 characters)'])
    end

    it 'User can create account with valid credentials' do
      user = User.new(id: 4, first_names: 'lucky', last_name: 'aremu', email: 'aremu@gmail.com', password: 'passsing')
      user.save
      expect(user).to be_valid
    end

    it 'expect users to increase by one if credentials are valid' do
      expect do
        User.create(id: 4, first_names: 'lucky',
                    last_name: 'aremu', email: 'aremu@gmail.com', password: 'passsing')
      end .to change { User.count }.by(1)
    end

    it { should have_many(:opinions) }
    it { should have_many(:friendships) }
    it { should have_many(:comments) }
    it { should have_many(:followers) }
  end
end
