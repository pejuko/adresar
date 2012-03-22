class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :title
      t.string :ico
      t.string :note
      t.string :web

      t.timestamps
    end
  end
end
