# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Noise, type: :model do

  describe '.create' do
    it 'creates a new noise record in database' do
      Noise.create(user_id: 1, content: 'hi')
      
      noise_find = Noise.last
      expect(noise_find.content).to include('hi')
    end
  end
end
