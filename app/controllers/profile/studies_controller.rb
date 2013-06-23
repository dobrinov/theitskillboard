class Profile::StudiesController < Profile::CommonController

   def index
    @studies = current_user.profile.studies
   end

   def create
    university_params = params[:study].delete(:university)

    @university = University.where(website: university_params[:website]).first_or_create(name: university_params[:name])
    @study      = Study.new params[:study]

    @study.profile    = current_user.profile
    @study.university = @university

    if @study.save
      flash[:notice] = 'Study added successfuly.'
    else
      flash[:error] = 'Study was not added.'
    end

    redirect_to profile_studies_path
   end

end