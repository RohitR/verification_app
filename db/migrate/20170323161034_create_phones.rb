class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :phone
      t.integer :pin, default: rand(1000..9999)
      t.datetime :pin_sent_at
      t.boolean :verified,default: false
      t.references :employer

      t.timestamps
    end
  end
end
