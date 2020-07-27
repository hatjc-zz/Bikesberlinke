require 'rails_helper'

describe User do
  #Validations for user signup
  context "missing email on sign up and password has min. 6 chars." do

    it 'New user requires email address' do
      expect(User.new(email: nil)).not_to be_valid
    end

    it 'New user requires password' do
      expect(User.new(email: "test@test.com", password:nil)).not_to be_valid
    end

    it 'password is NOT min. 6 characters' do
      expect(User.new(email: "test@test.com", password:"12345")).not_to be_valid
    end

  end
end
