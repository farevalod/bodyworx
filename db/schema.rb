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

ActiveRecord::Schema.define(:version => 20121203181938) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "catalogs", :force => true do |t|
    t.string   "ref"
    t.string   "matrix"
    t.float    "base"
    t.float    "proy"
    t.integer  "vol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clinics", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "doctors", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.integer  "clinic_id"
    t.date     "dob"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "doctors", ["clinic_id"], :name => "index_doctors_on_clinic_id"

  create_table "factura_venta", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "facturas", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inventories", :force => true do |t|
    t.string   "ref"
    t.string   "lot"
    t.string   "sn"
    t.integer  "factura_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "inventories", ["factura_id"], :name => "index_inventories_on_factura_id"

  create_table "patients", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transacts", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.integer  "factura_venta_id"
    t.integer  "estado"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "transacts", ["doctor_id"], :name => "index_transacts_on_doctor_id"
  add_index "transacts", ["factura_venta_id"], :name => "index_transacts_on_factura_venta_id"
  add_index "transacts", ["patient_id"], :name => "index_transacts_on_patient_id"

end
