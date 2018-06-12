# frozen_string_literal: true

class Coin < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :user_coins
  has_many :users, through: :user_coins
end
