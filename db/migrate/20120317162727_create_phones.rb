class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.references :contact

      t.timestamps
    end
    add_index :phones, :contact_id
  end
end
