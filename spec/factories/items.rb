include RandomData

FactoryGirl.define do
  factory :item do
    name RandomData.random_sentence
    user
  end
end

# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
