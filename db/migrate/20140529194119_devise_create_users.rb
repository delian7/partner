class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :ucinetid
      t.string :uci_affiliations
      t.string :first_name
      t.string :last_name
      t.integer :role, default: 0, null: false
      t.string :email, null: false, default: ''
      t.integer :current_course, null: false, default: ''
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.integer :age_in_seconds
      t.attachment :avatar
      t.timestamps
    end
  end
end