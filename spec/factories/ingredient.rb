FactoryBot.define do 
  factory :ingredient do
    name { "Tomato" }
  end
  factory :potato, parent: :ingredient do 
    name { "Potato" }
  end
  factory :cabbage, parent: :ingredient do 
    name { "Cabbage" }
  end
end

