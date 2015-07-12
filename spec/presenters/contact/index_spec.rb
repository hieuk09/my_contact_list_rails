require 'rails_helper'

describe Contact::Index do
  let(:params) { {} }
  let(:presenter) { described_class.new(params) }

  describe '#contacts' do
    let(:query) { 'query' }
    let(:page) { 1 }
    let(:per_page) { 10 }
    let(:sort_column) { 'name' }
    let(:sort_direction) { 'asc' }
    let(:params) { {
      query: query,
      page: page,
      per_page: per_page,
      sort: sort_column,
      direction: sort_direction
    } }
    let(:search_query) { instance_double('Contact::ByQuery') }
    let(:contacts) { [double('Contact')] }
    let(:scope) { double('ActiveRelation') }
    subject { presenter.contacts }

    before do
      expect(Contact).to receive(:page).with(page)
        .and_return(scope)
      expect(scope).to receive(:per).with(per_page)
        .and_return(scope)
      expect(scope).to receive(:order)
        .with(sort_column => sort_direction).and_return(scope)
      expect(Contact::ByQuery).to receive(:new)
        .with(scope, query).and_return(search_query)
      expect(search_query).to receive(:execute)
        .and_return(contacts)
    end

    it { is_expected.to eq contacts }
  end

  describe '#sortable' do
    let(:sortable_presenter) { instance_double('Contact::Sortable') }
    let(:params) { {
      sort: sort_column,
      direction: sort_direction,
      query: query
    } }
    let(:column) { 'name' }
    let(:sort_column) { 'name' }
    let(:sort_direction) { 'desc' }
    let(:query) { 'query' }

    context 'when title is present' do
      let(:title) { 'title' }

      it 'renders sortable link' do
        expect(Contact::Sortable).to receive(:new)
          .with(column, title, sort_column, sort_direction, query)
          .and_return(sortable_presenter)
      end
    end

    context 'when title is not present' do
      let(:title) { nil }

      it 'renders sortable link' do
        expect(Contact::Sortable).to receive(:new)
          .with(column, 'Tên', sort_column, sort_direction, query)
          .and_return(sortable_presenter)
      end
    end

    after do
      expect(sortable_presenter).to receive(:render)
      presenter.sortable(column, title)
    end
  end
end
