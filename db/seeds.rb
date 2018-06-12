# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

COINS = [
  {
    name: 'Bitcoin',
    symbol: 'BTC',
    type: 'crypto'
  },
  {
    name: 'Ethereum',
    symbol: 'ETH',
    type: 'crypto'
  },
  {
    name: 'US Dollar',
    symbol: 'USD',
    type: 'currency'
  }
]

coin_ids = {}
COINS.each do |coin|
  coin = Coin.create(
    name: coin[:name],
    symbol: coin[:symbol],
    currency_type: coin[:type]
  )
  coin_ids[coin.symbol] = coin.id
end

USERS = {
  'szilard@coin.com' => ['ETH', 'BTC'],
  'sean@coin.com' => ['BTC', 'USD']
}

USERS.each do |email, coins|
  user = User.create(email: email, password: 'coinlist007')
  Profile.create(
    user: user,
    bio: Faker::Company.industry,
    location: Faker::Address.city,
    phone: Faker::PhoneNumber.cell_phone
  )
  coins.each do |coin|
    UserCoin.create(user_id: user.id, coin_id: coin_ids[coin])
    Comment.create(
      user_id: user.id,
      coin_id: coin_ids[coin],
      body: Faker::Lorem.sentence(3)
    )
  end
end
