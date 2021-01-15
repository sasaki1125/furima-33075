FactoryBot.define do
  factory :product do
      name                 {"自転車"}
      description          {"未使用の自転車です"}
      category_id             { 2 }
      judgment_id             { 2 }
      status_id               { 2 }
      prefecture_id           { 2 }
      day_id                  { 2 }
      price                {300}
     
      association :user
      
      after(:build) do |product|
        product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end

end
