class Bank < ActiveRecord::Base
  has_many :transactions
  has_many :income

  def total
    transactions.pluck(:amount).inject(:+) || 0
  end
end
