class Profile::EmploymentsController < Profile::CommonController

  def index
    @employments = current_user.profile.employments
  end

  def create
    company_params = params[:employment].delete(:company)

    @company    = Company.where(website: company_params[:website]).first_or_create(name: company_params[:name])
    @employment = Employment.new params[:employment]

    @employment.profile = current_user.profile
    @employment.company = @company

    if @employment.save
      flash[:notice] = 'Employment added successfuly.'
    else
      flash[:error] = 'Employment was not added.'
    end

    redirect_to profile_employments_path
  end

end