require 'rails_helper'

describe Product do
  #Test average rating
  context "when the product has comments" do

    let!(:product) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }

    before do
      product.comments.create!(rating: 1, user: user, body: "lovely bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "returns the highest rating of all comments" do
      expect(product.highest_rating_comment.rating).to eq 5
    end

    it "returns the lowest rating of all comments" do
      expect(product.lowest_rating_comment.rating).to eq 1
    end

    #Validation if new product has a name
    it "is not valid without a name" do
      expect(Product.new(name:nil)).not_to be_valid
    end
  end
end
