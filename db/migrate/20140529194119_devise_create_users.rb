class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users, {:id => false}  do |t|
      ## Database authenticatable
      t.integer    :campus_id,          null: false, default: "", :uniqueness => :true
      t.string     :ucinetid
      t.string     :uci_affiliations
      t.string     :name
      t.integer    :role,               default: 0, null: false
      t.string     :email,              null: false, default: ""
      t.boolean    :status, :default => 0
      ## Rememberable
      #t.datetime :remember_created_at

     ## Trackable
      t.integer    :sign_in_count, default: 0, null: false
      t.datetime   :current_sign_in_at
      t.datetime   :last_sign_in_at
      t.string     :current_sign_in_ip
      t.string     :last_sign_in_ip
     # t.string   :auth_host
      t.integer    :age_in_seconds
      t.attachment :avatar

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.timestamps
    end
    # add_index :users, :ucinetid,                unique: true
    #  add_index :users, :campus_id,   unique: true
    #  add_index :users, :name,         unique: true
  end
end