require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(first_name: 'josh', last_name: 'jake', email: 'test@email.com', password: 'check123')

      expect(user).to be_a User
      expect(user.first_name).to eq 'josh'
      expect(user.last_name).to eq 'jake'
      expect(user.email).to eq 'test@email.com'
    end
  end
end