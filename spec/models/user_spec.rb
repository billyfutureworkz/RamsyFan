require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation' do
    it { should have_many(:dishes) }
  end
end