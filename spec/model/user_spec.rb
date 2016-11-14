require 'rails_helper'

describe User do
  context 'When created' do
    it "can't be created without data" do
      user = User.new
      expect(user.save).to eq(false)
    end

    it 'has to have valid email' do
      user = User.create(email: '@.pl')
      expect(user.save).to eq(false)
    end

    it 'has to have valid birtd day' do
      user = User.create(birth_day: '2019-01-01')
      expect(user.save).to eq(false)
    end

    it 'has to be valid.' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'Test',
        last_name: 'Example',
        birth_day: '2000-01-01',
        password: 'testpassword'
        
      )
      expect(user.save).not_to eq(false)
    end
  end
end
