FactoryGirl.define do

   sequence(:email) { |n| "user#{n}@example.com" }

   factory :user do
      email 
      password "5929785"
      first_name "New"
      last_name "user"
      admin false
    end

    factory :admin, class: User do  # specify class when factory does not have the same name as model
       email
       password "5929785"
       first_name "Admin"
       last_name "user"
       admin true
     end

  end
