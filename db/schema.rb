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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170103230839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'batches', force: :cascade do |t|
    t.string   'name',       null: false
    t.text     'details'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'readings', force: :cascade do |t|
    t.decimal  'temperature'
    t.decimal  'humidity'
    t.datetime 'created_at',                       null: false
    t.datetime 'updated_at',                       null: false
    t.decimal  'probe1_temperature', default: 0.0
  end

  create_table 'specific_gravities', force: :cascade do |t|
    t.decimal  'value',       null: false
    t.string   'stage',       null: false
    t.integer  'batch_id',    null: false
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.decimal  'temperature'
  end

end
