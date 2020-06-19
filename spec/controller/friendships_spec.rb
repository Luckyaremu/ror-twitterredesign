require 'rails_helper'
require 'capybara/rspec'

describe 'Friendship controller', type: :feature do
  before :each do
    m = User.new(email: 'lucky@gmail.com', password: '1234567')
    m.save
    
    visit '/users/sign_in'
    within('form') do
      fill_in 'user[email]', with: 'lucky@gmail.com'
      fill_in 'user[password]', with: '1234567'
    end
    click_button 'Log in'
  end
  it 'follow' do
    visit '/users'
    expect(page).to have_content 'unfrend'
  end
  it 'unfollow' do
    visit '/users'
    expect(page).to have_content 'follow'
  end
end
