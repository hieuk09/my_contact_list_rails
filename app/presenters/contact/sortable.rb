class Contact::Sortable
  attr_reader :column, :title, :sort_column, :sort_direction, :query

  def initialize(column, title, sort_column, sort_direction, query)
    @column = column
    @title = title
    @sort_column = sort_column
    @sort_direction = sort_direction
    @query = query
  end

  def render
    view = ActionView::Base.new(ActionController::Base.view_paths, {})
    view.render(partial: 'contacts/sortable', locals: parameters)
  end

  private

  def parameters
    {
      css_class: css_class,
      title: title,
      url: url
    }
  end

  def direction
    is_current_column? && is_ascending? ? 'desc' : 'asc'
  end

  def css_class
    is_current_column? ? "current #{sort_direction}" : nil
  end

  def is_current_column?
    column == sort_column
  end

  def is_ascending?
    sort_direction == 'asc'
  end

  def url
    Rails.application.routes.url_helpers.contacts_path({
      sort: column,
      direction: direction,
      query: query
    })
  end
end
