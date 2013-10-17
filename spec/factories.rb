FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    dob "10/10/10"
    gender "male"
    school "pune"
    password "aaaa"
    password_confirmation "aaaa"
  end
end