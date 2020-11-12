module Searches
  class TopicSearch
    extend Dry::Initializer

    param  :topic
    param  :from_member_id, Dry::Types['coercible.integer']

    # Finds topic experts and returns a path of Member friends for introduction
    # to a given start Member.
    def call
      expert_paths.map do |(expert, path)|
        members = path.map do |member_id|
          relevant_members.find{ |member| member.id == member_id }
        end
        Introduction.new(members, expert.topic)
      end
    end

    private

    # This helps me meet the "not already friends" requirement
    def excluded_member_ids
      # TODO: single query
      Member.find(from_member_id).friends.pluck(:id) + [from_member_id]
    end

    def friendship_graph
      @friendship_graph ||= GraphFriends.new.call
    end

    def to_experts
      @to_experts ||= TopicExperts.new(topic, excluded_member_ids).call
    end

    def path_to_member(to_member_id)
      FindPath.new(from_member_id, to_member_id, friendship_graph).call
    end

    # A list of all of the Experts (for the matching topic) and a path of
    # member_ids which links them through friendships to the from_member_id
    # The instructions don't say anything about experts with no friend connections. So we drop them
    def expert_paths
      expert_paths ||= to_experts.map do |expert|
        path = path_to_member(expert.member_id)
        [expert, path] if path
      end.compact
    end

    # All of the Member who are Experts. They could appear in many BaconBits
    # so we can avoid a lot of queries by pulling from this pool.
    def relevant_members
      @relevant_members ||= expert_paths.
        map{ |(_expert, path)| path }.
        flatten.sort.uniq.
        yield_self{ |member_ids| Member.where(id: member_ids) }
    end
  end
end
