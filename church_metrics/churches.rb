module ChurchMetrics
  class Churches < API

    def all
      @method = "all"
      error
    end

    def find(id)
      @method = "find"
      error
    end

    def info
      @url = "churches/me.json"
      call_api
    end

    def weekly_totals(category_id, week = {})
      # TODO find out what format week_reference needs to be
      category = "?category_id=#{category_id}"
      week = week.present? ? "&week_reference=#{week}" : ""
      @url = "churches/weekly_totals.json" + category + week
      call_api
    end

    private

    def error
      return "ERROR: the '#{@method}' method does not exist for this class"
    end

  end
end
