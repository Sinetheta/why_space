class MemberSearchesController < ApplicationController
  def topic_experts
    from_member_id = params[:member_id]
    @topic = params[:topic]
    @introductions = Searches::TopicSearch.new(@topic, from_member_id).call
  end
end
