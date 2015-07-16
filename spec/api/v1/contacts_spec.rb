require 'rails_helper'

describe '/api/v1/contacts' do
  describe 'POST /' do
    let(:name) { 'name' }
    let(:telephone) { 'telephone' }
    let(:address) { 'address' }
    let(:params) { {
      name: name,
      telephone: telephone,
      address: address
    } }
    let(:result) { JSON.parse(response.body) }

    context 'when contact can be created' do
      it 'creates contact' do
        expect {
          post '/api/v1/contacts', params
        }.to change { Contact.count }.by(1)
        expect(response.status).to eq 201
        expect(result['name']).to eq name
        expect(result['telephone']).to eq telephone
        expect(result['address']).to eq address
      end
    end

    context 'when contact can not be created' do
      let(:name) { '' }

      it 'does not creates contact' do
        expect {
          post '/api/v1/contacts', params
        }.not_to change { Contact.count }
        expect(response.status).to eq 400
        expect(result['error']).to eq 'Tên chưa được điền'
      end
    end
  end

  describe 'DELETE /:id' do
    let!(:contact) { create(:contact) }

    context 'when contact can be destroyed' do
      it 'destroy contact' do
        expect {
          delete "/api/v1/contacts/#{contact.id}"
        }.to change { Contact.count }.by(-1)

        expect(response.status).to eq 200
      end
    end

    context 'when contact can not be destroyed' do
      it 'returns error' do
        expect_any_instance_of(Contact).to receive(:destroy).and_return(false)
        delete "/api/v1/contacts/#{contact.id}"
        expect(response.status).to eq 400
      end
    end
  end
end
