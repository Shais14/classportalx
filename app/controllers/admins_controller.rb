class AdminsController < UsersController
  def index
    @admins = User.admins + User.superadmins
  end
    
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(user_params)
    if @admin.save
      flash[:success] = "Admin successfully added"
      redirect_to @admin
    else
      render 'new'
    end
  end
  
  private 

    def user_params
      params.require(:admin).permit(:name, :email, :password,
                                   :password_confirmation)
    end 
end