require "rails_helper"

describe UsersController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  describe "GET #show" do
    context "When a user is logged in" do
      before do
        sign_in @user
      end

      it "Loads correct user details" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end

      it 'Cannot access other users show page' do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "When a user is not logged in" do
      it "Redirects to login" do
      get :show, params: { id: @user.id }
      expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
