module ApplicationHelper
  # Returns the full title on per-page basis.
  def full_title(page_title = ' ')
    base_title = "Authentication"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
