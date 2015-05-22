# Delete this once done

class RonSearch

  def setup_lead_stream
    user = User.find_by_email("ronkatz@bpr.buzz")
    lead_stream = LeadStream.create(user_id: user.id, search_type: 'geocoded', name: "Hampstead Leads")

    keyword_list = ['illegal immigration', 'illegal immigrant', 'boarder controls', 'national health service', 'patient care nhs','complaints nhs','high taxes', 'unfair taxation', 'tax rise', 'high unemployment', "can find job",  "can find work", "elder care", 'neglect disabled', 'abuse disabled', 'education standards', 'schools quality', 'gun control', 'public safety', 'law enforcement', 'drunk driving', 'drug abuse', 'alcohol treatment', 'mental illness', 'sexual harrassment', 'domestic violence', 'bully children', 'social media bullying', 'teen suicide', 'pension senior citizens', 'care for aged', 'conditons senior citizens', 'high prices', 'cost of living', 'low wages']


    search_args = {}
    search_args[:search_type] = lead_stream[:search_type]
    search_args[:latitude] = 51.555050
    search_args[:longitude] = -0.173440

    keyword_list.each do |term|
      keyword = Keyword.create(lead_stream_id: lead_stream.id, term: term, admin_created: true)

      search_args[:keyword] = keyword

      search_results = TwitterSearch.new(user, search_args).search

      iterator_args = {}
      iterator_args[:keyword] = keyword
      iterator_args[:search_type] = lead_stream.search_type


      TwitterResultsIterator.new(search_results,iterator_args).iterate


    end

  end


end