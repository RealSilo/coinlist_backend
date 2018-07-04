# frozen_string_literal: true

Types::CommentableType = GraphQL::UnionType.define do
  name 'commentable'
  description 'Polymorphic comment'
  possible_types [Types::CoinType]

  # resolve_type -> (obj, ctx) do
  #   if obj.is_a?(Coin)
  #     return Types::CoinType
  #   end
  # end
end
