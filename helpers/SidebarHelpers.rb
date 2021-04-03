module SidebarHelpers
  def organized_article_listing
    grouped_articles = blog.articles.group_by { |article| article.metadata[:page]['section'] }
    sorted_keys = grouped_articles.keys()
    sorted_keys.each do |current_section|
      sorted_articles = grouped_articles[current_section].sort()
      current_section_better_written = current_section.split('-').join(' ')
      yield(current_section_better_written, sorted_articles)
    end
  end
end