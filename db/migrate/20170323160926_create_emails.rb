class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :email
      t.boolean :confirmed
      t.string :confirm_token
      t.references :employer

      t.timestamps
    end
  end
end
