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
  include Tester
  belongs_to :wallet, optional: true

  validates_presence_of :value
  validates_uniqueness_of :name

  validate :validate_name

  before_create do
    # Este método vem do helper Tester
    sum(2,2)
  end

  # Isto é uma validação personalizada
  def validate_name
    if self.name.nil?
      errors.add(:name, 'precisa estar presente')
    elsif self.name.length < 2
      errors.add(:name, 'muito pequeno, precisar ter mais de 2 letras')
    end
  end
end
