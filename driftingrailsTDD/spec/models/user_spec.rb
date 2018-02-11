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
    let (:params) { {first_name: 'jeremy', last_name: 'Fernandez', email: 'rf@gmail.com'} }
    before(:each) do
      User.new(params).save
      User.new(params).save
      User.new(params.merge({active:true})).save
      User.new(params.merge({active: false})).save
      User.new(params.merge({active: false})).save
    end
    
    it 'should return active users' do
        expect(User.active_users.size).to eq(3)
    end
    
    it 'should return inactive users' do
        expect(User.inactive_users.size).to eq(2)
    end
  end
end

    
