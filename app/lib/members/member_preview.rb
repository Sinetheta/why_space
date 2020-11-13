module Members
  class MemberPreview
    extend Dry::Initializer

    option :member_id
    option :friend_count
    option :full_name
    option :short_url
  end
end
