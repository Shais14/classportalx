class SuperAdminsController < UsersController
  def index
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin")
      @superadmins = User.superadmins
    else
      redirect_to static_pages_home_url
    end
  end
  
  #Can't create a superadmin  
  def new
    redirect_to static_pages_home_url
  end

  def create
    
  end
  
  def destroy
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin")
      flash[:danger] = "You cannot delete the super admin"
      redirect_to admins_url
    else
      redirect_to static_pages_home_url
    end
  end
end