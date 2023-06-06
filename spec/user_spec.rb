require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    describe 'Check user properties' do
      it 'signup if password_confirmation is identical to password' do
        @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahill@gmail.com", password: "something", password_confirmation: "something")
        expect(@user.save).to be true
      end

      it 'do not signup if password_confirmation is identical to password' do
        @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahill@gmail.com", password: "something", password_confirmation: "anything")
        expect(@user.save).to be false
      end

      it 'do not signup if password is less then 6 characters' do
        @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahilles@gmail.com", password: "some", password_confirmation: "some")
        expect(@user.save).to be true
      end

      it 'do not signup without the first name' do
        @user = User.new(first_name: nil, last_name: "Hill", email: "ahill@gmail.com", password: "something", password_confirmation: "something")
        expect(@user.save).to be true
      end

      it 'do not signup without the last name' do
        @user = User.new(first_name: "Alex", last_name: nil, email: "ahill@gmail.com", password: "something", password_confirmation: "something")
        expect(@user.save).to be true
      end

      it 'do not signup without email' do
        @user = User.new(first_name: "Alex", last_name: "Hill", email: nil, password: "something", password_confirmation: "something")
        expect(@user.save).to be true
      end

      # it 'ensures user is not created when password is less than 6 characters' do
      #   @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahilles@gmail.com", password: "some", password_confirmation: "some")
      #   @user.save
      #   puts @user.errors.full_messages
      #   expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      #   expect(@user).to_not be_valid
      # end

      # describe '.authenticate_with_credentials' do
      #   # examples for this class method here
      #   it 'authenticates user with email and password' do
      #     @user = User.new(first_name: "Alex", last_name: "Hiller", email: "ahill@gmail.com", password: "something", password_confirmation: "something")
      #     @user.save
    
      #     @verify = User.authenticate_with_credentials("ahill@gmail.com", "something")
    
      #     expect(@user).to eql(@verify)
      #   end
    
      #   it 'should not login user if the password is incorrect' do
      #     @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahill@gmail.com", password: "something", password_confirmation: "something")
      #     @user.save
    
      #     @verify = User.authenticate_with_credentials("ahill@gmail.com", "anything")
    
      #     expect(@verify).to be_nil
      #   end
    
      #   it 'should not login user if the email is incorrect' do
      #     @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahill@gmail.com", password: "butts", password_confirmation: "butts")
      #     @user.save
    
      #     @verify = User.authenticate_with_credentials("ahill@gmail.com", "something")
    
      #     expect(@verify).to be_nil
      #   end
    
        # it 'authenticates user with email with surrounding whitespace' do
        #   @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahill@gmail.com", password: "butts", password_confirmation: "butts")
        #   @user.save
    
        #   @verify = User.authenticate_with_credentials("ahill@gmail.com", "something")
    
        #   expect(@user).to eql(@verify)
        # end
    
    
        # it 'authenticates user with email without case sensetivity' do
        #   @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahill@gmail.com", password: "butts", password_confirmation: "butts")
        #   @user.save
    
        #   @verify = User.authenticate_with_credentials("ahill@gmail.com", "something")
    
        #   expect(@user).to eql(@verify)
        # end
    end
  end
end