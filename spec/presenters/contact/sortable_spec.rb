require 'rails_helper'

describe Contact::Sortable do
  describe '#render' do
    let(:column) { 'column' }
    let(:title) { 'title' }
    let(:sort_column) { 'sort_column' }
    let(:sort_direction) { 'sort_direction' }
    let(:query) { 'query' }
    let(:presenter) { described_class.new(column, title, sort_column, sort_direction, query) }
    subject { presenter.render }
    it { is_expected.to eq "<div>\n<a href=\"/contacts?direction=asc&amp;query=query&amp;sort=column\">title</a>\n<div class='arrow'></div>\n</div>\n" }
  end
end
