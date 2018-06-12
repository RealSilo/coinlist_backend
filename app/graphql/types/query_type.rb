require 'byebug'

Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :coins, types[Types::CoinType] do
    description 'Coins'
    resolve ->(obj, args, ctx) do
      Coin.all
    end
  end

  field :coin, Types::CoinType do
    argument :id, !types.ID
    description 'Coin'
    resolve ->(obj, args, ctx) do
      Coin.includes(comments: :user).find(args[:id])
    end
  end

  field :users, types[Types::UserType] do
    description 'Users'
    resolve ->(obj, args, ctx) {
      User.all.includes(:coins, :profile)
    }
  end

  field :user, Types::UserType do
    argument :id, !types.ID
    description 'User'
    resolve ->(obj, args, ctx) {
      User.find(args[:id])
    }
  end

  field :profile, Types::ProfileType do
    description 'Profile'
    resolve ->(user, args, ctx) {
      user.profile
    }
  end
end
