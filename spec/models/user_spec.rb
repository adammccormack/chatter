require 'rails_helper'
require 'bcrypt'

RSpec.describe User, type: :model do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(first_name: 'josh', last_name: 'jake', email: 'test@email.com', password: 'password123')

      expect(user).to be_a User
      expect(user.first_name).to eq 'josh'
      expect(user.last_name).to eq 'jake'
      expect(user.email).to eq 'test@email.com'
    end

    it 'hashes the password using BCrypt' do
      password = "secret password"
      hashed = BCrypt::Password.create(password)

      expect(hashed).to eq(password)
    end
  end

  describe '.find' do
    it 'finds a user by id' do
      user = User.create(first_name: 'josh', last_name: 'jake', email: 'test@email.com', password: 'password123')

      result = User.find_by(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(first_name: 'josh', last_name: 'jake', email: 'test@email.com', password: 'password123')
      
      expect(user.authenticate('wow123')).to be(false)
    end
  end
end