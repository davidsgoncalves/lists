# == Schema Information
#
# Table name: bills
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  value      :decimal(8, 2)
#  due_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  important  :boolean
#  wallet_id  :bigint
#
class Bill < ApplicationRecord
  belongs_to :wallet

  validates_presence_of :name, :value
end
