# frozen_string_literal: true

require 'bcrypt'

class UsersController < ApplicationController
  before_action :authorised, only: [:show]
  def index
    @users = User.all
  end

  def new
    render 'new'
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:notice] = "Welcome #{@user.username}"
      session[:user_id] = @user.id
      redirect_to root_path
    elsif @user.invalid?
      flash[:notice] = 'Username or email already in use, please try another one.'
      render 'new'
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end
end
