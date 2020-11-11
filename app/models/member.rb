class Member < ApplicationRecord
  belongs_to :user
  has_many :passions
  has_many :websites

  has_many :from_friendships, class_name: 'Friendship', foreign_key: 'from_member_id'
  has_many :to_friendships, class_name: 'Friendship', foreign_key: 'to_member_id'
  has_many :from_members, through: :to_friendships
  has_many :to_members, through: :from_friendships

  validates :full_name, presence: true

  def friends
    # TODO: single query
    from_members + to_members
  end
end
