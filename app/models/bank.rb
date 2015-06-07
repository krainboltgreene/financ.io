class Bank < ActiveRecord::Base
  belongs_to :organization
  has_many :transactions
  has_many :income

  def total
    transactions.pluck(:amount).inject(:+) || 0
  end
end
