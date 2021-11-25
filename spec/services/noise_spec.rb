
require 'noise'

describe Noise do
  describe '.all' do
    it 'returns all noises' do
      noises = Noise.all

      expect(noises).to include('oh hai')
      expect(noises).to include('hallooo')
      expect(noises).to include('wow')
    end
  end

end