# frozen_string_literal: true

require 'bcrypt'

class UsersController < ApplicationController
  before_action :authorised, only: [:show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def show; end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
