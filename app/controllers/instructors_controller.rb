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
    
    def destroy
      @instructor = Instructor.find(params[:id])
      #deleted_instructor_id = @instructor.id
      if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin")
        #In addition to deleting the instructor, we need to delete their course records (?)
        if Course.where(instructor: @instructor.name).blank?
          if @instructor.destroy
            flash[:success] = "Instructor deleted"
            redirect_to instructors_url
          else
            flash[:danger] = "An error occurred while deleting the instructor"
            redirect_to instructors_url
          end
        else
          flash[:danger] = "Cannot delete an instructor that is teaching a course"
          redirect_to instructors_url
        end
      else
        redirect_to static_pages_home_url
      end
    end
    
    private

    def user_params
      params.require(:instructor).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end