require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do 

    it "should confirm a user :email" do
      user = User.new({email: "blah", email_confirmation: "bla"})
      expect(user.save).to be(false)
    end

    it "should confirm a user :password" do 
      user = User.new({password: "blah", password_confirmation: "bla"})
      expect(user.save).to be(false)
    end

    it "should not create a user with a blank password" do
      user = User.new({email: "blah@blah.com", email_confirmation: "blah@blah.com"})
      expect(user.save).to be (false)
    end

    it "should not create a user with a blank email" do 
      user = User.new({password: "blah", password_confirmation: "blah"})
      expect(user.save).to be (false)
    end

    it "should require password_confirmation" do
      user = User.new({email: "blah@blah.com", email_confirmation: "blah@blah.com", password:"blah"})
      expect(user.save).to be (false)
    end

    it "should require :email confirmation" do
      user = User.new({email: "blah@blah.com", password: "blah", password_confirmation: "blah"})
      expect(user.save).to be (false)
    end

    it "should require :password length to be greater than seven characters" do
      user = User.new({email: "blah@blah.com", email_confirmation:"blah@blah.com", password:"blah", password_confirmation:"blah"})
      expect(user.save).to be (false)
    end

    it "should require :password to have both lower case and upper case letters" do
      user = User.new({email: "blah@blah.com", email_confirmation: "blah@blah.com", password: "blah", password_confirmation: "blah"})
      expect(user.save).to be (false)
    end
    
  end
end
