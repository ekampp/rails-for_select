require "spec_helper"

class User < ActiveRecord::Base
end

RSpec.describe User, type: :model do
  subject { User.for_select }
  before { allow(Rails.cache).to receive(:fetch).and_yield }
  let!(:user1) { User.create name: 'bob' }
  let!(:user2) { User.create name: 'tim' }

  it { is_expected.to match_array [['bob', 1], ['tim', 2]] }
end
