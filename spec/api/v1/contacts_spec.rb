require 'rails_helper'

describe '/api/v1/contacts' do
  describe 'POST /' do
    let(:name) { 'name' }
    let(:telephone) { 'telephone' }
    let(:address) { 'address' }
    let(:params) { {
      contact: {
        name: name,
        telephone: telephone,
        address: address
      }
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
end
