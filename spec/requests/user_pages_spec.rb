require 'spec_helper'

describe "UserPages" do
  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe "profile page" do

    before { visit user_path(user) }
    it { should have_selector('title',  text: user.name) }
    it { should have_selector('h1',    text: user.name) }
    
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do

      before do
        fill_in "Name",         with: "abc"
        fill_in "Email",        with: "a@a.com"
        fill_in "Dob", with: "10/10/2000"
        fill_in "Gender", with: "male"
        fill_in "School", with: "pune"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"

      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "Edit" do 
    before { visit  edit_user_path }
    describe "page" do
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Edit user") }
    end
  end
end
