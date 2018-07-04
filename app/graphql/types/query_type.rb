# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :coins, types[Types::CoinType] do
    description 'Coins'
    resolve ->(_obj, _args, _ctx) do
      Coin.all
    end
  end

  field :coin, Types::CoinType do
    argument :id, !types.ID
    description 'Coin'
    resolve ->(_obj, args, _ctx) do
      Coin.includes(comments: :user).find(args[:id])
    end
  end

  field :users, types[Types::UserType] do
    description 'Users'
    resolve ->(_obj, _args, _ctx) {
      User.all.includes(:coins, :profile)
    }
  end

  field :user, Types::UserType do
    argument :id, !types.ID
    description 'User'
    resolve ->(_obj, args, _ctx) {
      User.find(args[:id])
    }
  end

  field :profile, Types::ProfileType do
    description 'Profile'
    resolve ->(user, _args, _ctx) {
      user.profile
    }
  end
end
# rubocop:enable Metrics/BlockLength
