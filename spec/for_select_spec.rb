require "spec_helper"

class UserName < ActiveRecord::Base
end

class User < ActiveRecord::Base
  has_one :user_name
  delegate :name, to: :user_name
end

RSpec.describe User, type: :model do
  subject { User.for_select }
  before { allow(Rails.cache).to receive(:fetch).and_yield }
  let!(:user1) { User.create }
  let!(:name1) { UserName.create name: 'bob', user_id: user1.id }
  let!(:user2) { User.create }
  let!(:name2) { UserName.create name: 'tim', user_id: user2.id }

  it { is_expected.to match_array [['bob', 1], ['tim', 2]] }
end
