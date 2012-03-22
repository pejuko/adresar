class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :address

      t.timestamps
    end
    add_index :contacts, :address_id
  end
end
