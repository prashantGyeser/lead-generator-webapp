class ParseAndStoreReports

  def self.save_report(report)
    puts report
    begin

      city = City.find_by_name(report["city"])
      category = Category.find_by_name(report["category"])
      puts "the city is: #{category.inspect}"
      report_hash = {}
      report_hash[:total_tweets_for_day] = report["total_tweets_for_day"]
      report_hash[:date_collected] = report["date_collected"]
      report_hash[:city_id] = city.id
      report_hash[:category_id] = category.id

      return Report.create(report_hash)

    rescue
      Honeybadger.notify(
          :error_class   => "Report import error",
          :parameters    => report
      )
    end

  end


end