class SessionsController < ApplicationController
  include SessionsHelper
  #Read
  def index
  end
  #Read
  def show
  end

  #Create
  def new
  end
  #Create
  def create
    @user = User.find_by(email: params[:email].downcase)

    if @user && @user.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect_to @user
    else
    redirect_to login_path, flash: 'Please try again'
    end
  end

  #Update
  def edit
  end
  #Update
  def update
  end

  #Delete
  def delete
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end

end
