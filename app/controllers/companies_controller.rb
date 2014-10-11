class CompaniesController < ApplicationController
  def index
    @companies = Company.ordered
  end

  def show
    @company = find_company
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company
    else
      render :new
    end
  end

  def edit
    @company = find_company
  end

  def update
    @company = find_company

    if @company.update(company_params)
      redirect_to edit_company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company = find_company

    if @company
      @company.destroy
      redirect_to companies_path
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :website, :full_address)
  end

  def find_company
    Company.find(params[:id])
  end
end
