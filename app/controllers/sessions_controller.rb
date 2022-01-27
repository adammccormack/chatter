# frozen_string_literal: true

class SessionsController < ApplicationController

  # Read
  def show
    @user = User.find_by(id: session[:user_id])
  end

  # Create
  def new
  
  end

  # Create
  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in"
      redirect_to root_path
    elsif
        flash[:alert] = "Please activate your account."
    end
      flash[:alert] = "Invalid email/password combination"
      redirect_to login_path
  end

  # Update
  def edit; end

  # Update
  def update; end

  # Delete
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end
end
