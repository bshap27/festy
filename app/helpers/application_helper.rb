module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    if column == "count"
      direction = column == sort_column && sort_direction == "desc" ? "asc" : "desc"
    else
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    end
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

end
