class AdminsController < UsersController
  def index
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin")
      @admins = User.admins + User.superadmins
    else
      redirect_to static_pages_home_url
    end
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
  
  def destroy
    @admin = Admin.find(params[:id])
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin")
      if @admin.id == current_user.id
        flash[:danger] = "You cannot delete yourself"
        redirect_to admins_url
      elsif @admin.destroy
        flash[:success] = "Admin deleted"
        redirect_to admins_url
      end
    else
      redirect_to static_pages_home_url
    end
  end
  
  private 

    def user_params
      params.require(:admin).permit(:name, :email, :password,
                                   :password_confirmation)
    end 
end