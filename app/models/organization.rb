class Organization < ActiveRecord::Base
  has_many :accounts
  has_many :banks
  has_many :transactions
  has_many :incomes
end
