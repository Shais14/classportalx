class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @user.privilege = "student"
    if @user.save
      flash[:success] = "Welcome to the Class Portal!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
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
    
  public
    
    def newInstructor
      @instructor = User.new
    end
    
    def createInstructor
      @instructor = User.new(user_params)
      @instructor.privilege = "instructor"
      if @instructor.save
        flash[:success] = "Instructor successfully added"
        redirect_to static_pages_admin_url
      else
        render 'newInstructor'
      end
    end
    
    
    
end
