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
    if @student.save
      flash[:success] = "Welcome to the Class Portal!"
      redirect_to @student
    else
      render 'new'
    end
  end
  
  private 
  
  def view
    @student = Student.all
    render 'view'
  end
  
   def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
  
  
  private

    def user_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end