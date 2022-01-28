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
    else
      redirect_to login_path
    end
  end

  # Update
  def edit; end

  # Update
  def update; end

  # Delete
  def delete
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end
end
