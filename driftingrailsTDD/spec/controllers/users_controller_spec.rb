require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context 'Get index' do
        it 'return a success response for index' do
            get :index
            expect(response).to be_success
        end
        
        it 'returns a success response for show' do
            user = User.create!(first_name: 'jeremy', last_name: 'Fernandez', email: 'rf@gmail.com')
            get :show, params: {id: user.to_param}
            expect(response).to be_success
        end
        
    end
    
end
