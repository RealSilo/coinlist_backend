Types::ProfileType = GraphQL::ObjectType.define do
  name 'profile'
  description 'profile'

  field :id, !types.Int
  field :bio, !types.String
  field :location, !types.String
  field :phone, !types.String
end
