module Searches
  class TopicExperts
    extend Dry::Initializer

    param :topic
    param :excluded_member_ids

    # Returns a list of Experts which correspond to all members (with the
    # exception of specified ids) who have a Passion which matches† the topic.
    #
    # †: contained within, case-insensitive
    def call
      Member.joins(:passions).
        where("passions.topic LIKE ?", "%#{topic}%").
        where.not(id: excluded_member_ids).
        distinct.
        select(
          'members.id AS member_id',
          'passions.topic AS topic'
        ).
        map{ |result| Expert.new(result.as_json.symbolize_keys) }
    end
  end
end
