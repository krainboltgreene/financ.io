class CreateIncomes < ActiveRecord::Migration
  def change
    create_table(:incomes, id: :uuid) do |table|
      table.string :name, null: false, index: { unique: true }
      table.integer :amount, null: false, default: 0, index: true
      table.integer :rate, null: false, default: 0, index: true
      table.uuid :bank_id, null: false, index: true
      table.date :start_at, null: false, index: true
      table.datetime :deleted_at, index: true
      table.timestamps null: false, index: true
    end
  end
end
