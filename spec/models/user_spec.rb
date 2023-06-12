require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is valid when given the correct details' do
    user = User.new(username: "Sam", email: "sam@example.com", password: "password123")
    expect(user).to be_valid
  end

  it 'is not valid when a username is not provided' do
    user = User.new(email: "sam@example.com", password: "password123")
    expect(user).to_not be_valid
  end

  it 'is not valid when a password of incorrect length is given' do
    user = User.new(username: "Sam", email: "Sam@example.com", password: "short")
  end
end
