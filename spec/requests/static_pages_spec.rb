require 'spec_helper'

describe "StaticPages" do
	subject { page }
  describe "Home page" do 
  	before { visit home_path }
  	it { should have_selector('h1', text: 'Home') }
  	it { should have_selector('title', text: 'Home') }
  	
  end
end
