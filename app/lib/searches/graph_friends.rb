module Searches
  class GraphFriends
    DEFAULT_FRIENDSHIP_WEIGHT = 1

    # Returns a 2 dimensional array which represents all of the friendships
    # as weighted edges of graph of member ids.
    # eg: [ [from_member_id, to_member_id, weight] ]
    #
    def call
      Friendship.all.
        pluck(:from_member_id, :to_member_id).
        map{ |friends| friends.append(DEFAULT_FRIENDSHIP_WEIGHT) }
    end
  end
end
