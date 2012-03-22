class CreateFirmsTags < ActiveRecord::Migration
  def change
    create_table :firms_tags do |t|
      t.references :firm
      t.references :tag
    end
    add_index :firms_tags, :firm_id
    add_index :firms_tags, :tag_id
  end
end
