# == Schema Information
#
# Table name: bills
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  value      :decimal(8, 2)
#  deadline   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  important  :boolean
#
class Bill < ApplicationRecord
  validates_presence_of :name, :value
end
