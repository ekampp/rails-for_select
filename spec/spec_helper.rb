require 'bundler/setup'
Bundler.setup

require 'rails/all'
require 'rails/for_select'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :user_names, force: true do |t|
    t.integer :user_id
    t.string :name
    t.timestamps null: false
  end

  create_table :users, force: true do |t|
    t.timestamps null: false
  end
end

RSpec.configure do |config|
end
