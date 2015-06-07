class CreateBanks < ActiveRecord::Migration
  def change
    create_table(:banks, id: :uuid) do |table|
      table.string :name, null: false, default: "", index: true
      table.string :public, null: false, default: "", index: true
      table.string :private, null: false, default: "", index: true
      table.uuid :organization_id, index: true, null: false
      table.datetime :deleted_at, index: true
      table.timestamps null: false

      table.index [:name, :organization_id], unique: true
    end
  end
end
