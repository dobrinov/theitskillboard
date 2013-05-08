class SkillsController < ApplicationController
  def create
    @course = Course.find(params[:course_id]) # This should be secured
    @skill  = Skill.find(params[:skill][:id])

    @course.skills << @skill

    if @course.save
      redirect_to profile_educations_path(params[:profile_id])
    else
      # ???
    end
  end

  def destroy
  end
end