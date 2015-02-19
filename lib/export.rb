class Export

  def lead_non_leads_to_csv
    leads = Lead.where("created_at >= :date", date: "2014-12-01")
  end

end