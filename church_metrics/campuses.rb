module ChurchMetrics
  class Campuses < API

    def weekly_totals(campus_id, category_id, week = {})
      # TODO find out what format week_reference needs to be
      category = "?category_id=#{category_id}"
      week = week.present? ? "&week_reference=#{week}" : ""
      @url = "campuses/#{campus_id}/weekly_totals.json" + category + week
      call_api
    end

  end
end
