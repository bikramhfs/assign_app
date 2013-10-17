require 'spec_helper'

describe "SigninSessions" do

	let(:user) { FactoryGirl.create(:user) }
	subject { page }
	describe "signin" do 

		before { visit  signin_path }

		describe "with invalid information" do 
			before { click_button "Sign in" }
			it { should have_selector('title', text: 'Sign in') }
			
		end
		describe "with valid information" do 
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password

			end
			it { should have_selector('title', text: 'Sign in') }
			it { should have_selector('h1', text: 'Sign in') }
		end

	end
end
