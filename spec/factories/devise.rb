FactoryBot.define do
  factory :user do
    id {  }
    email {'test@email.com'}
    password { 'password' }
    username { 'TestUser'}
    admin { false }
    bio { 'Test bio' }

    factory :admin_user do
      admin { true }
      username { 'TestAdmin'}
      email { 'test@admin.com' }
    end
  end
end