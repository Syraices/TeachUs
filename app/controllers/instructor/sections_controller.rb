class Instructor::SectionsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    # if @course.user != current_user
    #   render plain: 'Unauthorized', status: :Unauthorized
    # end
    @section = Section.new
  end

  def create 
    @course = Course.find(params[:course_id])
    @section = @course.sections.create(section_params)
    redirect_to instructor_course_path(@course)
  end
end


private 

# def current_section
#   @current_section ||= Section.find(params[:section_id])
# end

def section_params
  params.require(:section).permit(:title)
end
