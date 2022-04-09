# frozen_string_literal: true

class SessionsController < ApplicationController
  # Read
  def show
    @user = User.find_by(id: session[:user_id])
  end

  # Create
  def new; end

  # Create
  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      redirect_to root_path
    else
      redirect_to login_path
      flash[:notice] = "Wrong username or passsword."
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

  private

  def user_params
    params.permit(:username, :email, :password)
  end
  
end


