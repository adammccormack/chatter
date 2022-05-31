# frozen_string_literal: true

class NoisesController < ApplicationController
  def index
    # Fetch the user from the database, using an ID stored in the session
    @user = User.find_by(id: session[:user_id])

    @noises = Noise.all.order('created_at DESC')
  end

  def new
    @noise = Noise.new
  end

  def edit; end

  def create
    @noise = Noise.new(noise_params)
    @noise.save
    
    redirect_to root_path
  end

  def show; end

  private

  def noise_params
    params.require(:noise)permit(:content)
  end
end
