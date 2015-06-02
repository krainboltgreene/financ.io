class CreateTransactions < ActiveRecord::Migration
  def change
    create_table(:transactions, id: :uuid) do |table|
      table.integer :amount, null: false, default: 0, index: true
      table.string :note, null: false, default: ""
      table.uuid :bank_id, null: false, index: true
      table.uuid :income_id, index: true
      table.date :applied_at, null: false, index: true
      table.datetime :deleted_at, index: true
      table.timestamps null: false
    end
  end
end
