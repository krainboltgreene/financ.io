class CreateIncomes < ActiveRecord::Migration
  def change
    create_table(:incomes, id: :uuid) do |table|
      table.string :name, null: false, index: true
      table.integer :amount, null: false, default: 0, index: true
      table.integer :rate, null: false, default: 0, index: true
      table.uuid :bank_id, null: false, index: true
      table.uuid :organization_id, index: true, null: false
      table.date :start_at, null: false, index: true
      table.datetime :deleted_at, index: true
      table.timestamps null: false, index: true

      table.index [:name, :organization_id], unique: true
    end
  end
end
