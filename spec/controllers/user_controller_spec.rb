require "rails_helper"

describe UsersController, type: :controller do

  before do
  @user = FactoryBot.create(:user)
  @user2 = FactoryBot.create(:user)
  #let(:user) { User.create!(first_name: "Sample", last_name: "Joe", email:"test3@test.com", password:"123456") }
  #let(:user2) { User.create!(first_name: "John", last_name: "Doe", email:"test4@test.com", password:"abcdef") }
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

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        }.to change(User,:count).by(1)
      end
    end

    context "with invalid attributes" do
        it "does not create a new user" do
          expect{
            post :create, params: { user: FactoryBot.attributes_for(:user, password: "1234") }
          }.to raise_error(/Password is too short/)
        end
      end
  end




end
