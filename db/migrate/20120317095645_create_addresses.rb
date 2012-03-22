class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :city
      t.string :street
      t.string :psc
      t.references :firm

      t.timestamps
    end
    add_index :addresses, :firm_id
  end
end
