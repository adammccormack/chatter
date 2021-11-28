class NoisesController < ApplicationController

  def index
    @noises = Noise.all.order('created_at DESC')
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

  def show
  end


  private

  def noise_params
    params.permit(:content)
  end

end 