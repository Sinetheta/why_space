class Member < ApplicationRecord
  belongs_to :user
  has_many :websites

  validates :full_name, presence: true
end
