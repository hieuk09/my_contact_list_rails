require 'rails_helper'

describe ContactsController, type: :controller do
  describe 'GET index' do
    let(:contact) { double('Contact', name: 'name',
                           address: 'address', telephone: 'telephone') }
    let(:presenter) { instance_double('Contact::Index', contacts: [contact]) }

    before do
      expect(Contact::Index).to receive(:new)
        .and_return(presenter)
    end

    it 'renders page' do
      get :index
      expect(response).to be_success
    end
  end
end
