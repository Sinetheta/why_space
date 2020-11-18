module Searches
  class GraphFriends
    DEFAULT_FRIENDSHIP_WEIGHT = 1

    # Returns a 2 dimensional array which represents all of the friendships
    # as weighted edges of graph of member ids.
    # eg: [ [from_member_id, to_member_id, weight] ]
    #
    # For each bi-directional Friendship record we two entries, one for
    # each direction.
    #
    def call
      Friendship.all.
        pluck(:from_member_id, :to_member_id).
        flat_map{ |friends| [friends, friends.reverse] }.
        map{ |friends| friends.append(DEFAULT_FRIENDSHIP_WEIGHT) }
    end
  end
end
