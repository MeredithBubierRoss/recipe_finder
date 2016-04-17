require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:email).when("test@test.com") }
  it { should_not have_valid(:email).when(nil, " ", "test@test") }
end
