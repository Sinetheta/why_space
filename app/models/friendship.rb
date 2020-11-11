class Friendship < ApplicationRecord
  belongs_to :from_member, class_name: 'Member'
  belongs_to :to_member, class_name: 'Member'
end
