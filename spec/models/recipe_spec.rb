require 'rails_helper'

describe Recipe, type: :model do
  it { should have_valid(:name).when("Pizza") }
  it { should_not have_valid(:name).when(nil, " ", "") }

  it { should have_valid(:instructions).when("bake") }
  it { should_not have_valid(:instructions).when(nil, " ", "") }

  it { should have_valid(:ingredients).when("sauce") }
  it { should_not have_valid(:ingredients).when(nil, " ", "") }

  it { should have_valid(:duration).when("45 minutes") }
  it { should_not have_valid(:duration).when(nil, " ", "") }
end
