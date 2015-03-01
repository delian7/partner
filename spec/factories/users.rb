FactoryGirl.define do
  factory :professor, class: User do
    first_name "Kay"
    email "kay@uci.edu"
    role '2'
  end
  
  factory :student1, class: User do
    first_name "Delian"
    email "durenm@uci.edu"
    role '0'
    id 100
  end
  
  factory :student2, class: User do
    first_name "Christina"
    email "ryderc@uci.edu"
    role '0'
    id 101
  end

  
end
