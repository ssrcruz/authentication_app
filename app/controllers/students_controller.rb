class StudentsController < ApplicationController

  def create
    @student = current_user.students.build(student_params)
    if @student.save
      flash.now[:success] = "New student created!"
      render current_user
    else
      redirect_to root_url
    end
  end


  private

  def student_params
    params.require(:student).permit(:name)
  end
end
