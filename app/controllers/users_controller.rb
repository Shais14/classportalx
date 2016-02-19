class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  
<<<<<<< HEAD
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Class Portal!"
      redirect_to @user
    else
      render 'new'
    end
  end
=======
  #Can't create a user without a privilege
  #def new
  #  @user = User.new
  #end
  #def create
  #  @user = User.new(user_params)
  #  if @user.save
  #    flash[:success] = "Welcome to the Class Portal!"
  #    redirect_to @user
  #  else
  #    render 'new'
  #  end
  #end
>>>>>>> a10f98fb6359441795f17285368d209ad92fbd76
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Edited!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
