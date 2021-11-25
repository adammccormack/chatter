class NoiseController < ApplicationController

  def index
    @noises = Noise.all
  end

end