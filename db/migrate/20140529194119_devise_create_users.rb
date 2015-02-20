class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # ## Database authenticatable
      t.string     :ucinetid, limit: 20
      t.string     :uci_affiliations, limit: 50
      t.string     :first_name, limit: 20
      t.string     :last_name, limit: 20
      t.integer    :role,               default: 0, null: false, limit: 1
      t.string     :email,              null: false, default: ""
      t.string     :phone,              default: "", limit: 12
      t.integer    :current_course, null: false, default: "", limit: 5
      t.integer    :current_project, null: false, default: "", limit: 5
      t.string     :description,               default: "", limit: 500
      t.string     :availability,               default: "", limit: 500

      ## Trackable
      t.integer    :sign_in_count, default: 0, null: false
      t.datetime   :current_sign_in_at
      t.datetime   :last_sign_in_at
      t.string     :current_sign_in_ip
      t.string     :last_sign_in_ip

      # t.string   :auth_host
      t.integer    :age_in_seconds
      t.attachment :avatar
      t.timestamps
    end
  end
end
