class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations, id: :uuid do |table|
      table.string :name, index: { unique: true }
      table.string :slug, index: { unique: true }
      table.datetime :deleted_at, index: true
      table.timestamps null: false, index: true
    end
  end
end
