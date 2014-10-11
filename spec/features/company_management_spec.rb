require 'spec_helper'

feature 'Company management' do
  scenario 'create a new company' do
    attributes = company_attr(attributes_for(:company, :unparsed_address))

    visit root_path
    click_link 'New company'

    fill_form_and_submit(:company, attributes)

    expect(page).to have_content(I18n.t('flashes.companies.create.success'))

    visit companies_path
    company = Company.first

    expect(page).to have_content(company.name)
  end

  scenario 'update company' do
    company = create(:company)
    attributes = company_attr(attributes_for(:company,
                                             :unparsed_address,
                                             name: 'Acme Co.'))

    visit root_path
    click_link company.name
    click_link 'Edit'
    fill_form_and_submit(:company, :update, attributes)

    expect(page).to have_content(attributes[:name])
    expect(page).to have_content('Cambridge')
    expect(page).to have_content('MA')
    expect(page).to have_content('02142')
  end

  scenario 'delete company' do
    company = create(:company)

    visit root_path
    click_link company.name
    click_link 'Delete'

    expect(page).to have_content(I18n.t('flashes.companies.destroy.success'))
  end
end

def company_attr(company)
  company['Street Address'] = company.delete(:full_address)
  company
end
