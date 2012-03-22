class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :firm

      t.timestamps
    end
    add_index :tags, :firm_id
  end
end
