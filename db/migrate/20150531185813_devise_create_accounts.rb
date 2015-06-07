class DeviseCreateAccounts < ActiveRecord::Migration
  def change
    create_table(:accounts, id: :uuid) do |table|
      table.string :email, null: false, default: "", index: true
      table.uuid :organization_id, index: true, null: false
      table.string :encrypted_password, null: false, default: ""
      table.string :reset_password_token, index: { unique: true }
      table.datetime :reset_password_sent_at, index: true
      table.datetime :remember_created_at, index: true
      table.integer :sign_in_count, default: 0, null: false
      table.datetime :current_sign_in_at, index: true
      table.datetime :last_sign_in_at, index: true
      table.inet :current_sign_in_ip
      table.inet :last_sign_in_ip
      table.string :confirmation_token, index: { unique: true }
      table.datetime :confirmed_at, index: true
      table.datetime :confirmation_sent_at, index: true
      table.string :unconfirmed_email, index: true
      table.integer :failed_attempts, default: 0, null: false, index: true
      table.string :unlock_token, index: { unique: true }
      table.datetime :locked_at, index: true
      table.datetime :deleted_at, index: true
      table.timestamps null: false, index: true

      table.index [:email, :organization_id], unique: true
    end
  end
end
