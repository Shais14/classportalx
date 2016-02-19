class InstructorsController < UsersController
    def index
      @instructors = Instructor.all
    end
  
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
    
    def edit
      @instructor = Instructor.find(params[:id])
    end
    
    def update
      @instructor = Instructor.find(params[:id])
      if @instructor.update_attributes(user_params)
        flash[:success] = "Edited Instructor!"
        redirect_to @instructor
      else
        render 'edit'
      end
    end
    
    private

    def user_params
      params.require(:instructor).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end