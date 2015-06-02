class CreateBanks < ActiveRecord::Migration
  def change
    create_table(:banks, id: :uuid) do |table|
      table.string :name, null: false, default: "", index: { unique: true }
      table.string :public, null: false, default: "", index: true
      table.string :private, null: false, default: "", index: true
      table.datetime :deleted_at, index: true
      table.timestamps null: false
    end
  end
end
