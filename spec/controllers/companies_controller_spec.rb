require 'spec_helper'

describe CompaniesController do
  describe 'GET #index' do
    before(:each) do
      @companies = create_list(:company, 5)

      get :index
    end

    it 'assigns an array of companies to @companies' do
      expect(assigns[:companies]).to match_array(@companies)
    end

    it 'renders the :index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before(:each) do
      @company = create(:company)

      get :show, id: @company
    end

    it 'assigns the company to @company' do
      expect(assigns[:company]).to eq(@company)
    end

    it 'renders the :show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    before(:each) { get :new }

    it 'assigns a new company to @company' do
      expect(assigns(:company)).to be_a_new(Company)
    end

    it 'renders the :new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    before(:each) do
      @company_attr = attributes_for(:company)
    end

    context 'valid attributes' do
      it 'creates a Company' do
        expect { post_company }.to change(Company, :count).by(1)
      end

      it 'redirects to #show' do
        post_company

        expect(response).to redirect_to(company_path(assigns[:company]))
      end

      it 'sets the :success flash' do
        post_company

        should set_the_flash[:success]
      end

      context 'with an address' do
        it 'sets the address fields' do
          @company_attr = attributes_for(:company, :unparsed_address)

          post_company
          company = assigns[:company]

          expect(company.city).to eq('Cambridge')
          expect(company.state).to eq('MA')
          expect(company.zipcode).to eq('02142')
        end
      end
    end

    context 'invalid attributes' do
      before(:each) do
        @company_attr = { name: '' }
      end

      it "doesen't create a new company" do
        expect { post_company }.to change(Company, :count).by(0)
      end

      it 'renders the :new template' do
        post_company

        expect(response).to render_template(:new)
      end

      it 'sets the :failure flash' do
        post_company

        should set_the_flash[:failure]
      end
    end
  end

  describe 'GET #edit' do
    before(:each) do
      @company = create(:company)
      get :edit, id: @company
    end

    it 'assigns the company to @company' do
      expect(assigns[:company]).to eq(@company)
    end

    it 'renders the :edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    before(:each) do
      @company = create(:company)
    end

    context 'valid attributes' do
      before(:each) do
        @company_attr = { name: 'Best company' }
        patch_company
      end

      it 'updates the company' do
        @company.reload

        expect(@company.name).to eq(@company_attr[:name])
      end

      it 'redirects to #edit' do
        patch_company

        expect(response).to redirect_to(company_path(@company))
      end

      it 'sets the :success flash' do
        patch_company

        should set_the_flash[:success]
      end
    end

    context 'address attributes' do
      context 'valid' do
        it 'sets the address fields' do
          @company_attr = { full_address: '222 3rd Street, Cambridge, MA, 02142' }

          patch_company
          @company.reload

          expect(@company.city).to eq('Cambridge')
          expect(@company.state).to eq('MA')
          expect(@company.zipcode).to eq('02142')
        end
      end

      context 'invalid' do
        it "doesn't sets the address fields" do
          @company_attr = { full_address: '222 3rd Street' }

          patch_company

          expect(assigns[:company].errors.messages).to(
            eq({ full_address: ['not a valid address'] }))
        end
      end
    end

    context 'invalid attributes' do
      before(:each) do
        @company_attr = { name: '' }
        patch_company
      end

      it "doesn't update the company" do
        @company.reload

        expect(@company.name).to_not eq(@company_attr[:name])
      end

      it 'renders :edit' do
        expect(response).to render_template(:edit)
      end

      it 'sets the :failure flash' do
        patch_company

        should set_the_flash[:failure]
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @company = create(:company)
    end

    it 'deletes the contact' do
      expect { delete_company }.to change(Company, :count).by(-1)
    end

    it 'redirects to #index' do
      delete_company

      expect(response).to redirect_to(companies_path)
    end

    it 'sets the :success flash' do
      delete_company

      should set_the_flash[:success]
    end
  end
end

def post_company
  post :create, company: @company_attr
end

def patch_company
  patch :update, id: @company.id, company: @company_attr
end

def delete_company
  delete :destroy, id: @company.id
end
