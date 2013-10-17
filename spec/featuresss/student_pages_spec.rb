require 'spec_helper'

describe "StudentPages" do
  subject { page }
 
  	describe "profile page" do
    let(:student) { FactoryGirl.create(:student) }
    before { visit student_path(student) }

    it { should have_selector('h1',    text: student.name) }
    it { should have_selector('title', text: student.name) }
  end
end
