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

  create_table :users, force: true do |t|
    t.string :name
    t.timestamps null: false # Prepare for Rails 5
  end
end

RSpec.configure do |config|
end
