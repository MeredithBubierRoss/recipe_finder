require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:favorited) }
  it { should_not belong_to(:recipe) }
end
