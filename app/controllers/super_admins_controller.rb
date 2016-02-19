class SuperAdminsController < UsersController
  def index
      @superadmins = User.superadmins
  end
  
  #Can't create a superadmin  
  def new
    redirect_to static_pages_home_url
  end

  def create
    
  end
end