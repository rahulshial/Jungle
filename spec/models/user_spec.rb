require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do
    let (:user) {User.new(name: 'whats up', email: 'whats@up.com', password: '123', password_confirmation: '123')}
    
    it "should be a valid user" do
      expect(user).to be_valid
    end

    it "should be invalid passwords not matching" do
      user.password_confirmation = '23'
      expect(user).to be_invalid
    end

    it "should be have a name" do
      user.name = nil
      expect(user).to be_invalid
    end

    it "should be have a email" do
      user.email = nil
      expect(user).to be_invalid
    end

    it "password should be maximum 8 characters" do
      user.password = '1234567890'
      expect(user).to be_invalid
    end

    it "password should be minimum 3 characters" do
      user.password = '1'
      expect(user).to be_invalid
    end

    it 'it must be created with a unique email' do
      @user = User.new(name: 'John Doe', email: 'john@example.com', password: '12345', password_confirmation: '12345')
      @user.save!
      @user1 = User.new(name: 'Jane', email: 'JOHN@example.com', password: '54321', password_confirmation: '54321')
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include('Email has already been taken')
    end
  end
  
  describe '.authenticate_with_credentials' do
    let(:user) {User.new(name: "john doe", email: "john@mail.com", password: "123", password_confirmation: "123")}

    it "should return true when password and email are good" do
      user.save!
      @new_login = user.authenticate_with_credentials("john@mail.com", "123")
      expect(@new_login).to be_truthy
    end
    
    it "should return false when email is incorrect" do
      user.save!
      @new_login = user.authenticate_with_credentials("jane@mail.com", "123")
      expect(@new_login).to be_falsey
    end
    
    it "should return false when password is incorrect" do
      user.save!
      @new_login = user.authenticate_with_credentials("john@mail.com", "23")
      expect(@new_login).to be_falsey
    end
    
    it "should return truthy even when email contains leading or trailing whitespace" do
      user.save!
      @new_login = user.authenticate_with_credentials("   john@mail.com   ", "123")
      expect(@new_login).to be_truthy
    end

    it "should return truthy even when email is cased differently" do
      user.save!
      @new_login = user.authenticate_with_credentials("JOHN@mail.com", "123")
      expect(@new_login).to be_truthy
    end
    
    it "should return nil when password and email aren't found in DB" do
      user.save!
      @new_login = user.authenticate_with_credentials("john@aol.com", "123")
      expect(@new_login).to be_nil
    end    
  end
end
