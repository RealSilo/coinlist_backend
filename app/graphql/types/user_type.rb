# frozen_string_literal: true

Types::UserType = GraphQL::ObjectType.define do
  name 'user'
  description 'all users'

  field :id, !types.Int
  field :email, !types.String
  field :profile, !Types::ProfileType
  field :coins, !types[Types::CoinType]
end
