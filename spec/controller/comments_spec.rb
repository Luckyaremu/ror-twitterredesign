require 'rails_helper'
require 'capybara/rspec'

describe 'Comment controller', type: :feature do
  before :each do
    m = User.new(email: 'luckyaremu@gmail.com', password: '8710111213')
    m.save

    visit '/users/sign_in'
    within('form') do
      fill_in 'user[email]', with: 'luckyaremu@gmail.com'
      fill_in 'user[password]', with: '8710111213'
    end
    click_button 'Log in'
  end
  it 'it commments in a post' do
    visit '/users'
    within('form') do
      fill_in 'opinions.content', with: 'like your post'
    end
    click_button 'Commit'
    within('new_comment') do
      fill_in 'comment[content]', with: 'something'
    end
    click_button 'Commit'
    expect(page).to have_content 'something'
  end
end
