# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120318142148) do

  create_table "addresses", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "street"
    t.string   "psc"
    t.integer  "firm_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "addresses", ["firm_id"], :name => "index_addresses_on_firm_id"

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "address_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contacts", ["address_id"], :name => "index_contacts_on_address_id"

  create_table "firms", :force => true do |t|
    t.string   "title"
    t.string   "ico"
    t.string   "note"
    t.string   "web"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "firms_tags", :force => true do |t|
    t.integer "firm_id"
    t.integer "tag_id"
  end

  add_index "firms_tags", ["firm_id"], :name => "index_firms_tags_on_firm_id"
  add_index "firms_tags", ["tag_id"], :name => "index_firms_tags_on_tag_id"

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "phones", ["contact_id"], :name => "index_phones_on_contact_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "firm_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["firm_id"], :name => "index_tags_on_firm_id"

end
