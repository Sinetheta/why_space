class Member < ApplicationRecord
  belongs_to :user

  validates :full_name, presence: true
end
