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
      return shortest_path[1..-1] if shortest_path.length > 1
    end

    private

    # This gems expects a directed graph, so we need to sort the vertices if
    # we want it to recognize all connections.
    # We're doing it inside this class because I have also seen the gem
    # metate the array and I don't want it wreck the friendship_graph.
    def undirected_graph
      friendship_graph.map{ |(x, y, weight)| [x, y].sort + [weight] }
    end

    def on_the_graph?
      graphed_ids.include?(to_member_id)
    end

    def graphed_ids
      friendship_graph.map{ |(x, y, _weight)| [x, y] }.flatten
    end

    def shortest_path
      @shortest_path ||= ::Dijkstra.new(from_member_id, to_member_id, undirected_graph).shortest_path
    end
  end
end
