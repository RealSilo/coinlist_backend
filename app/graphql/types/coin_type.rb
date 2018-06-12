# frozen_string_literal: true

Types::CoinType = GraphQL::ObjectType.define do
  name 'coin'
  description 'coin'

  field :id, !types.Int
  field :symbol, !types.String
  field :name, !types.String
  field :currency_type, !types.String
  field :comments, !types[Types::CommentType]
end
