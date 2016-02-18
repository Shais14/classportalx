class StudentsController < UsersController
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

    def user_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end