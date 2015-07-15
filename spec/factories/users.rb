FactoryGirl.define do
  factory :user do
    email                 'user-test-1@example.com'
    password              'password'
    password_confirmation 'password'
  end
end