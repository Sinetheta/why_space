module Members
  class AllMemberPreviews
    # Returns a list of MemberPreview which hold a rundown of Member vitals.
    def call
      results.map do |h|
        MemberPreview.new(h.as_json.symbolize_keys)
      end
    end

    private

    def results
      Member.joins(
          :websites, # If you can tell me what's wrong here I'll fix it ;)
          members.join(from_friends, Arel::Nodes::OuterJoin).on(from_friends[:from_member_id].eq(members[:id])).join_sources,
          members.join(to_friends, Arel::Nodes::OuterJoin).on(to_friends[:to_member_id].eq(members[:id])).join_sources,
        ).
        group(:member_id).
        select(
          members[:id].as('member_id'),
          members[:full_name],
          websites[:short_url],
          (
            from_friends[:id].count(true) +
            to_friends[:id].count(true)
          ).as('friend_count')
        )
    end

    def members
      Member.arel_table
    end

    def from_friends
      Friendship.arel_table.alias('from_friends')
    end

    def to_friends
      Friendship.arel_table.alias('to_friends')
    end

    def websites
      Website.arel_table
    end
  end
end
