require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
      
    it 'ensures first name is present' do
        user = User.new(last_name: 'Fernandez', email: 'RF@gmail.com').save
        expect(user).to eq(false)
    end
    
    it 'ensures last name is present' do
        user = User.new(first_name: 'Jeremy', email: 'RF@gmail.com').save
        expect(user).to eq(false)
    end
    
    it 'ensures email is present' do
        user = User.new(first_name: 'Jeremy', last_name: 'Fernandez').save
        expect(user).to eq(false)
    end
    
    it 'should save successfully' do
        user = User.new(first_name: 'jeremy', last_name: 'Fernandez', email: 'rf@gmail.com').save
        expect(user).to eq(true)
    end
  end
  
  context 'scope test' do
  end
end
