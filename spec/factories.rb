require 'faker'
FactoryGirl.define do
  factory :user do
    sequence(:username)   { |n| "Droid #{n}" }
    sequence(:email)      { |n| "droid_#{n}@swapaway.com"}
    password              "buffalowings"
    password_confirmation "buffalowings"
    
    factory :admin do
      admin true
    end
  end

  factory :wiki, class: WickedWiki::Wiki do
    sequence(:title)     { |n| "#{Faker::Lorem.word}#{n}" }
    content              Faker::Lorem.sentence(100)
    protection           "no protection"
    ip                   "127.0.0.1"
  end

  factory :revision, class: WickedWiki::Revision do
    content              Faker::Lorem.sentence(100)
    wiki
    ip                   "127.0.0.1"
  end

  factory :image, class: WickedWiki::Image do
    wiki
    name "rails"
    file File.open('app/assets/images/wicked_wiki/rails.png')
  end
end
