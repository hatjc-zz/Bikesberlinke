require "rails_helper"

describe ProductsController, type: :controller do

describe "GET #index" do
  it "Loads the product page" do
    get :index
    expect(response).to be_ok
    expect(response).to render_template('index')
    expect(response).to have_http_status(200)
  end
end

describe "GET #show" do

  let!(:product) {FactoryBot.create(:product)}

  it "Loads a single product page" do
    subject {get :show, params: {id: product}}
    expect(response).to be_ok
    expect(response).to have_http_status(200)
  end
end

describe 'POST #create' do
  context 'with valid attributes' do
  it 'create a valid product'do
  expect{
   post :create, params: {product: FactoryBot.attributes_for(:product)}
   }.to change(Product, :count).by(1)
  end
  end


  context 'with invalid attributes' do
  it 'does not create a product' do
    expect{
     post :create, params: {product: FactoryBot.attributes_for(:product, name: nil)}
     }.not_to change(Product, :count)
  end
  end

end


describe "PUT #update price" do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.build(:admin)
    sign_in @user
  end

  it "successfully updates product price" do
    @price = { name: @product.name, image_url: @product.image_url, id: @product.id, price: "3500" }
    put :update, params: { id: @product.id, product: @price }
    @product.reload
    expect(@product.price).to eq 3500
  end
end

describe "DELETE #destroy" do

  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.build(:admin)
    sign_in @user
  end

  it "should allow admin to delete product" do
    expect(delete :destroy, params: {id: @product} ).to redirect_to(products_url)
  end
end

end
