require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com")
                   #   password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it {should respond_to(:password)}
  it { should respond_to(:password_confirmation)}

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
    
    describe "when email is not present" do
        before { @user.email = " " }
        it { should_not be_valid }
        
        describe "when name is too long" do
            before { @user.name = "a" * 51 }
            it { should_not be_valid }
          end
      end
  end
end