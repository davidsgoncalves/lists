# == Schema Information
#
# Table name: wallets
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Wallet < ApplicationRecord
  has_many :bills

  validates_presence_of :name
end
