require 'rails_helper'

RSpec.describe User, type: :model do
  it "return false when the register email is not unique" do
    a = User.new(:email => "test@example.com", :password => '123')
    a.save
    b = User.new(:email => "test@example.com", :password => '123')
    expect(b).to be_invalid
  end

  it "return false when the password is blank" do
    a = User.new(:email => "test@example.com")
    expect(a).to be_invalid
  end

  it "return true when the password is not blank" do
    a = User.new(:email => "test@example.com", :password => '123')
    expect(a).to be_valid
  end

  it "return true when the register email is unique" do
    a = User.new(:email => "a@example.com", :password => '123')
    a.save
    b = User.new(:email => "b@example.com", :password => '123')
    expect(b).to be_valid
  end
end