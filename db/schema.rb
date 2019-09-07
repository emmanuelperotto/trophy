# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_907_231_713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'collected_coins', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.integer 'value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_collected_coins_on_user_id'
  end

  create_table 'deaths', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_deaths_on_user_id'
  end

  create_table 'killed_monsters', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'monster_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['monster_id'], name: 'index_killed_monsters_on_monster_id'
    t.index ['user_id'], name: 'index_killed_monsters_on_user_id'
  end

  create_table 'monsters', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'reward_users', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'reward_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['reward_id'], name: 'index_reward_users_on_reward_id'
    t.index ['user_id'], name: 'index_reward_users_on_user_id'
  end

  create_table 'rewards', force: :cascade do |t|
    t.integer 'type'
    t.integer 'required_value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'deaths_count', default: 0
    t.integer 'collected_coins_count', default: 0
    t.integer 'killed_monsters_count', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'collected_coins', 'users'
  add_foreign_key 'deaths', 'users'
  add_foreign_key 'killed_monsters', 'monsters'
  add_foreign_key 'killed_monsters', 'users'
  add_foreign_key 'reward_users', 'rewards'
  add_foreign_key 'reward_users', 'users'
end
