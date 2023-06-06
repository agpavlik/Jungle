require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'signup if password_confirmation is identical to password' do
      @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahill@gmail.com", password: "something", password_confirmation: "something")
      expect(@user.save).to be true
    end

    it 'do not signup if password_confirmation is not identical to password' do
      @user = User.new(first_name: 'Alex', last_name: "Hill", email: 'ahill@gmail.com', password: "something", password_confirmation: "anything")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'do not signup if password is less then 6 characters' do
      @user = User.new(first_name: "Alex", last_name: "Hill", email: "ahilles@gmail.com", password: "some", password_confirmation: "some")
      expect(@user.save).to be false
    end

    it 'do not signup without the first name' do
      @user = User.new(first_name: nil, last_name: "Hill", email: "ahill@gmail.com", password: "something", password_confirmation: "something")
      expect(@user.save).to be false
    end

    it 'do not signup without the last name' do
      @user = User.new(first_name: "Alex", last_name: nil, email: "ahill@gmail.com", password: "something", password_confirmation: "something")
      expect(@user.save).to be false
    end

    it 'do not signup without email' do
      @user = User.new(first_name: "Alex", last_name: "Hill", email: nil, password: "something", password_confirmation: "something")
      expect(@user.save).to be false
    end

    it 'do not signup if email is not unique' do
      @userOne = User.new(first_name: 'Alex', last_name: "Hill", email: 'ahill@gmail.com', password: "something", password_confirmation: "something")
      @userOne.save
      @userTwo = User.new(first_name: 'Alexito', last_name: "Valey", email: 'ahill@gmail.com', password: "anything", password_confirmation: "anything")
      @userTwo.save
      expect(@userTwo.errors.full_messages).to include("Email has already been taken")
    end

  end

  describe '.authenticate_with_credentials' do

    it 'login user if email and password are correct' do
      @user = User.new(first_name: 'Alex', last_name: "Hill", email: 'ahill@gmail.com', password: "something", password_confirmation: "something")
      @user.save
      @user_check = User.authenticate_with_credentials('ahill@gmail.com', "something")
      expect(@user).to eq(@user_check)
    end

    it 'login user if email has spaces arround' do
      @user = User.new(first_name: 'Alex', last_name: "Hill", email: 'ahill@gmail.com', password: "something", password_confirmation: "something")
      @user.save
      @user_check = User.authenticate_with_credentials('    ahill@gmail.com     ', "something")
      expect(@user).to eq(@user_check)
    end

    it 'login user if email types in the wrong case' do
      @user = User.new(first_name: 'Alex', last_name: "Hill", email: 'ahill@gmail.com', password: "something", password_confirmation: "something")
      @user.save
      @user_check = User.authenticate_with_credentials('AHill@Gmail.com', "something")
      expect(@user).to eq(@user_check)
    end

  end

end