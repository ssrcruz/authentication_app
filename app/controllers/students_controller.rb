class StudentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

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
    @student.destroy
    flash[:success] = "Successfully deleted"
    redirect_to request.referrer || root_url
  end


  private

  def student_params
    params.require(:student).permit(:name, :parent_name, :parent_email)
  end

  def correct_user
    @student = current_user.students.find_by(id: params[:id])
    redirect_to root_url if @student.nil?
  end
end
