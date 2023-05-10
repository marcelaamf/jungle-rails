require 'rails_helper'

RSpec.describe UserSpec, type: :model do
 
    before (:all) do
      @user = User.create(first_name: "Jhon", last_name: "Doe", email: "test4@example.com", password: "password", password_confirmation: "password")
    end

    describe "user validation" do
      it "Create new user with all attributes" do
        expect(@user).to be_valid
      end

      it "user first name should no be blank" do
        @user.first_name = nil
        expect(@user).to_not be_valid
      end

      it "user last name should no be blank" do
        @user.last_name = nil
        expect(@user).to_not be_valid
      end


      it "Password should not be blank" do
        @user.password = nil
        expect(@user).to_not be_valid
      end

      it "password should have a minimun of 8 carachters length" do
      @user = User.new(first_name: "Doe", last_name:"Alice", email: "adoe@example.com", password: "abcde", password_confirmation: "abcde")
      expect(@user).to_not be_valid
      end
      
      it "should have a password_confirmation" do
        @user.password_confirmation = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "Should not create user if password and password_confirmation are not the same" do
        @user.password_confirmation = "blabla"
        expect(@user).to_not be_valid
      end

      it "Email should not be blank" do
        @user.email = nil
        expect(@user).to_not be_valid
      end

      it "emails should be unique for each user and not case sensitive" do
        @user_with_existing_email = User.new(first_name: "Bruce", last_name: "Wayne", email: "TEST4@example.com", password: "batman", password_confirmation: "batman")
        expect(@user_with_existing_email).to_not be_valid
      end  
       
      after (:all) { @user.destroy } 
    end

  describe '.authenticate_with_credentials' do
    before (:all) do
      @user = User.create(first_name: "Daine", last_name: "Prince", email: "daianeww@example.com", password: "wonderwoman", password_confirmation: "wonderwoman")
    end

    it "should authenticate with valid email and password" do
      @user = User.create(first_name: "Tony", last_name: "Stark", email: "stark@example.com", password: "Iron-man", password_confirmation: "Iron-man")
      @session = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@session).to eq(@user)
    end

    it "should not authenticate without a valid email" do
      @session = User.authenticate_with_credentials('email', @user.password)
      expect(@session).to_not eq(@user)
    end

    it "should not authenticate without a valid password" do
      @session = User.authenticate_with_credentials(@user.email, "password")
      expect(@session).to_not eq(@user)
    end

    it "should authenticate with trailing spaces around the email" do
      @user.email = " daianeww@example.com"
      @session = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@session).to eq(@user)
    end

    it "should authenticate without being case sensitive" do
      @user.email = "DAianeww@example.cOm"
      @session = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@session).to eq(@user)
    end

    after (:all) { @user.destroy }
  end
end
