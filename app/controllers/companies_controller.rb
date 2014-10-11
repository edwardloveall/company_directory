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
      CompanyAddresser.perform!(company: @company)
      flash[:success] = t('flashes.companies.create.success')
      redirect_to @company
    else
      flash[:failure] = t('flashes.companies.create.failure')
      render :new
    end
  end

  def edit
    @company = find_company
  end

  def update
    @company = find_company

    if @company.update(company_params)
      CompanyAddresser.perform!(company: @company)
      flash[:success] = t('flashes.companies.update.success')
      redirect_to @company
    else
      flash[:failure] = t('flashes.companies.update.failure')
      render :edit
    end
  end

  def destroy
    @company = find_company

    if @company.destroy
      flash[:success] = t('flashes.companies.destroy.success')
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
