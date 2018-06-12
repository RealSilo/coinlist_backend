# frozen_string_literal: true

class UserCoin < ApplicationRecord
  belongs_to :user
  belongs_to :coin
end
