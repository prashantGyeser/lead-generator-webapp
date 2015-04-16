class SearchStats

  def set_search_stats(search_result_count, duplicate_count, keyword)
    keyword.last_result_count = search_result_count
    keyword.last_duplicate_count = duplicate_count
    keyword.save
  end

end