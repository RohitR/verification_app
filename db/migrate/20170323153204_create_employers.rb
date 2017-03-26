class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.string :name
      t.boolean :gender
      t.string :location
      t.string :dob
      t.string :password_digest

      t.timestamps
    end
  end
end
