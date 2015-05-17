class Contact::Index
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def contacts
    search_query.execute
  end

  def sortable(column, title = nil)
    title ||= I18n.t("contacts.#{column}")
    Contact::Sortable.new(
      column,
      title,
      sort_column,
      sort_direction,
      query
    ).render
  end

  private

  def scope
    Contact.page(page).per(per_page).order(sort_column => sort_direction)
  end

  def search_query
    Contact::ByQuery.new(scope, query)
  end

  def sort_direction
    @sort_direction ||= %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    @sort_column ||= Contact.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def query
    params[:query]
  end

  def page
    params[:page]
  end

  def per_page
    params[:per_page]
  end
end
