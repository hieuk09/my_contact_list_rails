class Contact::ByQuery
  attr_reader :scope, :query

  def initialize(scope, query)
    @scope = scope
    @query = query
  end

  def execute
    if query.present?
      scope.where('name LIKE ? OR telephone LIKE ?', normalize_query, normalize_query)
    else
      scope
    end
  end

  private

  def normalize_query
    @normalize_query ||= "%#{query}%"
  end
end
