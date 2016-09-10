require 'rails_helper'

describe Member do
  it "is valid with a name, stevnes_email_account and password" do
    member = Member.new(
      name: "Josh",
      email: "ykobayas@stevens.edu",
      password: "yasuoyasuo")
    expect(member).to be_valid
  end

  it "is invalid without a name" do
    member = Member.new(name: nil)
    member.valid?
    expect(member.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    member = Member.new(email: nil)
    member.valid?
    expect(member.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    member = Member.new(password: nil)
    member.valid?
    expect(member.errors[:password]).to include("can't be blank")
  end

  it "is invalid more than 20 characters name"

  it "is invalid with a duplicate email address"

end
