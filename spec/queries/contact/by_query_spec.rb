require 'rails_helper'

describe Contact::ByQuery do
  describe '#execute' do
    let(:query_string) { 'query_string' }
    let(:scope) { Contact }
    let(:query) { described_class.new(scope, query_string) }
    let(:name) { 'name' }
    let(:telephone) { '123456789' }
    let!(:contact) { create(:contact, name: name, telephone: telephone) }
    subject { query.execute.pluck(:id) }

    context 'when query is similar to name' do
      let(:name) { 'query_string 123' }
      it { is_expected.to eq [contact.id] }
    end

    context 'when query is similar to telephone' do
      let(:telephone) { '123 query_string' }
      it { is_expected.to eq [contact.id] }
    end

    context 'when query is not present' do
      let(:query_string) { '' }
      it { is_expected.to eq [contact.id] }
    end

    context 'otherwise' do
      it { is_expected.to eq [] }
    end
  end
end
