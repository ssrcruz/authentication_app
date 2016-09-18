class StudentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @student = current_user.students.build(student_params)
    if @student.save
      flash.now[:success] = "New student created!"
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  def destroy

  end


  private

  def student_params
    params.require(:student).permit(:name)
  end
end
