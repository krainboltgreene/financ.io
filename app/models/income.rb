class Income < ActiveRecord::Base
  has_many :transactions
  belongs_to :bank

  after_create :create_nonrecurring_transaction

  def create_nonrecurring_transaction
    if rate.zero?
      transactions.create(amount: amount, applied_at: started_at, bank: bank)
    end
  end
  private :create_nonrecurring_transaction
end
