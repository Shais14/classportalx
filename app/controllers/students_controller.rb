class StudentsController < UsersController
  # has_and_belongs_to_many :courses, :class_name => 'Course'

  def index
    @students = Student.all
  end
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(user_params)
<<<<<<< HEAD
    if @student.save
      flash[:success] = "Welcome to the Class Portal!"
      redirect_to "/static_pages/student"
=======
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin")
      if @student.save
        flash[:success] = "Student added"
        redirect_to static_pages_home_url
      else
        render 'new'
      end
>>>>>>> 5e60d685e4165af71822a347182aadf8b66b0508
    else
      if @student.save
        flash[:success] = "Welcome to the Class Portal!"
        redirect_to "/static_pages/student"
      else
        render 'new'
      end
    end
    
  end
  
<<<<<<< HEAD
  
  private 
  
  # def view
  #   @student = Student.all
  #   render 'view'
  # end
  
   def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
=======
  def destroy
    @student = Student.find(params[:id])
    deleted_student_id = @student.id
    if logged_in? && (current_user.type == "Admin" || current_user.type == "SuperAdmin")
      #In addition to deleting the student, we need to delete their course records
      if @student.destroy && StudentCourse.where(student_id: deleted_student_id).destroy_all
        flash[:success] = "Student deleted"
        redirect_to students_url
      end
    else
      redirect_to static_pages_home_url
>>>>>>> 5e60d685e4165af71822a347182aadf8b66b0508
    end
  end
  
  private

    def user_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end