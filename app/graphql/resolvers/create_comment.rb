# frozen_string_literal: true

class Resolvers::CreateComment < GraphQL::Function
  # arguments passed as "args"
  argument :description, !types.String
  argument :url, !types.String

  type Types::CommentType

  def call(_obj, args, _ctx)
    Comment.create!(
      body: args[:body],
      commentable_id: args[:commentable_id],
      commentable_type: args[:commentable_type],
      user_id: 1
    )
  rescue => e
    GraphQL::ExecutionError.new(e)
  end
end
