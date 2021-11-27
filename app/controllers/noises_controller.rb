class NoisesController < ApplicationController

  def index
    @noises = Noise.all
  end

  def new
    @noise = Noise.new
  end

  def edit
  end

  def create
    @noise = Noise.new(noise_params)
    @noise.save

    redirect_to root_path
  end

  def noise_params
    params.permit(:content, :user_id)
  end

end 