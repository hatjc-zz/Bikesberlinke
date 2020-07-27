require 'rails_helper'

describe Comment do
    #Validations for creating new comment
  context "does comment have message and rating?" do

    it "does not have a rating" do
      expect(Comment.new(rating: nil)).not_to be_valid
    end

    it "does not have a comment" do
      expect(Comment.new(body: nil)).not_to be_valid
    end

  end
end
