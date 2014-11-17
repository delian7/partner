FactoryGirl.define do
  factory :professor, class: User do
    first_name "Professor Kay"
    email "kay@uci.edu"
    role '2'
  end
  
  factory :student, class: User do
    first_name "Delian Petrov"
    email "petrovd@uci.edu"
    role '0'
  end
end
