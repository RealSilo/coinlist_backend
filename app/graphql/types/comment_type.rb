# frozen_string_literal: true

Types::CommentType = GraphQL::ObjectType.define do
  name 'comment'
  description 'comment'

  field :id, !types.Int
  field :body, !types.String
  field :user, Types::UserType
  field :coin, !types[Types::CoinType]
end
