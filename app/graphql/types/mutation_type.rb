# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createComment, Types::CommentType do
    argument :body, !types.String
    argument :commentable_id, !types.ID
    argument :commentable_type, !types.String
    description 'Create a polymorphic comment'
    resolve ->(_obj, args, ctx) {
      begin
        Comment.create!(
          body: args[:body],
          commentable_id: args[:commentable_id],
          commentable_type: args[:commentable_type],
          user_id: 1
        )
      rescue => e
        GraphQL::ExecutionError.new(e)
      end
    }
  end
end
