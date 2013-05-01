require 'spec_helper'

describe User do
  describe "validations" do
    it "requires an email address" do
      subject.email = nil
      subject.should have(1).error_on :email
    end

    it "requires an email address to be unique" do
      FactoryGirl.create(:user, :email => "test@example.com")
      subject.email = "test@example.com"
      subject.should have(1).error_on :email
    end

    it "requires an email address to be unique and case insensitive" do
      FactoryGirl.create(:user, :email => "test@example.com")
      subject.email = "Test@example.com"
      subject.should have(1).error_on :email
    end

    it "requires a password" do
      subject.password = nil
      subject.should have(1).error_on :password
    end

    it "requires a password to be longer than 6 characters" do
      subject.password = "123"
      subject.should have(1).error_on :password
    end
  end
end
