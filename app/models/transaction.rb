class Transaction < ActiveRecord::Base
  belongs_to :income
  belongs_to :bank
end
