class SessionsController < ApplicationController
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

    if @user.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    end
    redirect_to root_path
  end

  #Update
  def edit
  end
  #Update
  def update
  end

  #Delete
  def delete
  end

end
