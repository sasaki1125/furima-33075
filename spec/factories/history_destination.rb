FactoryBot.define do
  factory :history_destination do
    
    post_code                 {"012-3456"}
    prefecture_id             { 2 }
    city                      { "東京" }
    address                   { "新宿区" }
    building_name             { nil }
    phone_number              { 12345678912 }
    token {"tok_abcdefghijk00000000000000000"}
    
      
  end
end
