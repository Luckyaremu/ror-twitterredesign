require 'rails_helper'
require 'capybara/rspec'
describe 'Testing following feature in views', type: :feature do
  before :each do
    a = User.new(first_names: 'lucky', last_name: 'aremu', email: 'user@example.com', password: 'password1234')
    a.save
    b = User.new(first_names: 'first', last_name: 'last', email: 'rhosy@example.com', password: 'password1234')
    b.save

    visit '/users/sign_in'
    within('main') do
      fill_in 'user[email]', with: 'user@example.com'
      fill_in 'user[password]', with: 'password1234'
    end
    click_button 'commit'
  end
  it 'A valid user can send a post or opinion' do
    visit '/users'

    click_on 'Follow'
    visit '/users'
    expect(page).to have_content 'Unfollow'
  end
end
