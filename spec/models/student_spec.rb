# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  dob        :date
#  gender     :string(255)
#  school     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Student do
	before { @student = Student.new(name: "Student1", email: "student1@gmail.com", dob:10/10/10, gender: "M", school: "pune") }
	subject { @student }
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:dob) }
	it { should respond_to(:gender) }
	it { should respond_to(:school) }
	it { should be_valid }

	describe "when name is not present" do
		before { @student.name = " " }
		it { should_not be_valid }
	end
	describe "when email is not present" do 
		before { @student.email = " " }
		it { should_not be_valid }
	end
	describe "when  dob is not present" do
		before { @student.dob = " " }
		it { should_not be_valid }
	end
	describe "when  gender is not present" do
		before { @student.gender = " " }
		it { should_not be_valid }
	end
	describe "when  school is not present" do
		before { @student.school = " " }
		it { should_not be_valid }
	end
	describe "when name is too long " do
		before { @student.name = "a" * 31 }
		it { should_not be_valid }
	end
	describe "when email id is invalid" do 
		it "should be invalid " do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
				foo@bar_baz.com foo@bar+baz.com]
				addresses.each do |invalid_address|
					@student.email = invalid_address
					@student.should_not be_valid
				end
			end
		end
		describe "when email id is valid" do 
			it " should be valid" do 
				addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
				addresses.each do |valid_address|
					@student.email = valid_address
					@student.should be_valid
				end
			end
		end
		describe "when email id is already taken" do 
			before do
				student_with_same_email = @student.dup
				student_with_same_email.save
			end
			it { should_not be_valid }
		end

		describe "when email address with mixed case" do
			let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

			it "should be saved as all lower-case" do
				@student.email = mixed_case_email
				@student.save
				@student.reload.email.should == mixed_case_email.downcase
			end
		end
	end
