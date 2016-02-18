class AdminsController < UsersController
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
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end 
end