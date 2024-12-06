require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'Kaci', last_name: 'Doe', email: 'kaci_doe@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(last_name: 'Doe')
    expect(user).not_to be_valid
  end

  it 'has a default reader role' do
    user = User.new(name: 'Kaci', last_name: 'Doe', email: 'kaci_doe@example.com', password: 'password')
    expect(user.role).to eq('reader')
  end
end
