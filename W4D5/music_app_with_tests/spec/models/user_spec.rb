require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email: "test@1.com", session_token: "QOkuES8O27m3eRGjZWp3Mw", password_digest: "$2a$10$QkZHzS49va.9MhYrlsMZf.jsoYTnc0INzB/kBe19mfCwNwdy1k2JS") }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it "should check if password is correct" do 
    expect(user.is_password?("testing")).to be_truthy
  end
  it "should reset the session token" do 
    session_token = user.session_token
    user.reset_session_token
    expect(user.session_token).to_not eq(session_token) 
  end
  it "find a user by their credentials" do 
    expect(User.find_by_credentials('test@1.com', 'testing')).to be_truthy
  end

end
