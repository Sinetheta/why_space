module Searches
  class FindPath
    extend Dry::Initializer

    param  :from_member_id, Types::Coercible::Integer
    param  :to_member_id, Types::Coercible::Integer
    param  :friendship_graph

    # Returns an array of integers that represents the shortest chain of friends
    # from the from_member_id to_member_id on the friendship_graph if such
    # a chain exists.
    def call
      return nil unless on_the_graph? # Prevents a stack overflow in the gem
      return shortest_path if shortest_path.length > 1
    end

    private

    def on_the_graph?
      graphed_ids.include?(to_member_id)
    end

    def graphed_ids
      friendship_graph.map{ |(x, y, _weight)| [x, y] }.flatten
    end

    def shortest_path
      @shortest_path ||= ::Dijkstra.new(from_member_id, to_member_id, friendship_graph).shortest_path
    end
  end
end
