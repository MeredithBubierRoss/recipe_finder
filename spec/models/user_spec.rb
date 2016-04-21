require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:email).when("test@test.com") }
  it { should_not have_valid(:email).when(nil, " ", "test@test") }

  it { should have_valid(:password).when("password") }
  it { should_not have_valid(:password).when(nil, " ") }
end
