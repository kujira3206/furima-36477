FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'t00000'}
    password_confirmation {password}
  end
end