

class CreateOpportunitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :require_organization, only: [:new]

  def index
    @create_opportunity = CreateOpportunity.all
  end

  def new
    @create_opportunity = CreateOpportunity.new
  end

  def show
    @create_opportunity = CreateOpportunity.find(params[:id])
  end

  def create
    @create_opportunity = current_user.create_opportunities.build(create_opportunity_params)

    respond_to do |format|
      if @create_opportunity.save
        format.html { redirect_to search_opportunities_path, notice: 'Opportunity was successfully created.' }
        format.json { render :show, status: :created, location: @create_opportunity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @create_opportunity = CreateOpportunity.find(params[:id])

    if @create_opportunity.update(create_opportunity_params)
      redirect_to search_opportunities_path, notice: 'Opportunity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @create_opportunity = CreateOpportunity.find(params[:id])
    @create_opportunity.destroy

    redirect_to search_opportunities_path, notice: 'Opportunity was successfully deleted.'
  end

  private

  def create_opportunity_params
    params.require(:create_opportunity).permit(:title, :description, :organization_name, :email, :location, :date,
                                               :time)
  end

  def require_organization
    return if current_user.organization?

    flash[:alert] = 'You do not have permission to access this page.'
    redirect_to root_path
  end
end
