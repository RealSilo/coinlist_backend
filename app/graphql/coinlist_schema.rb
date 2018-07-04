# frozen_string_literal: true

CoinlistSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)

  resolve_type -> (obj, ctx) do
    if obj.is_a?(Coin)
      Types::CoinType
    end
  end
end
