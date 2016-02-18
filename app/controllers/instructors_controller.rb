class InstructorsController < UsersController
   def new
      @instructor = Instructor.new
    end
    
    def create
      @instructor = Instructor.new(user_params)
      if @instructor.save
        flash[:success] = "Instructor successfully added"
        redirect_to static_pages_admin_url
      else
        render 'newInstructor'
      end
    end 
    
    private

    def user_params
      params.require(:instructor).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end