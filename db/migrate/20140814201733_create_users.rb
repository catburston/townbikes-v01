class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :username
      t.string      :first_name
      t.string      :last_name
      t.string      :password_digest
      t.string      :location
      t.string      :email_address
      t.text        :description
      t.integer     :phone_number
      t.attachment  :avatar
      t.string      :confirmation_token
      t.boolean     :confirmed, default: false
      t.timestamps
    end
  end
end
