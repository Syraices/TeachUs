class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_enrollment

  def show 
  end

  private 

  helper_method :current_lesson
  def current_lesson 
    @current_lesson ||= Lesson.find(params[:id])
  end

  
  def verify_enrollment
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course_id), alert: 'You must enroll to continue.'
    end
  end
end
