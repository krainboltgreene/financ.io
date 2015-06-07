class Income < ActiveRecord::Base
  belongs_to :organization
  belongs_to :bank
  has_many :transactions

  after_create :create_nonrecurring_transaction

  def create_nonrecurring_transaction
    if rate.zero?
      transactions.create(amount: amount, applied_at: started_at, bank: bank)
    end
  end
  private :create_nonrecurring_transaction
end
