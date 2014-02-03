module ChurchMetrics
  class API
    require 'rest_client'

    attr_reader :base, :key, :user, :url, :base_url, :klass

    def initialize
      @base = "https://churchmetrics.com/api/v1/"
      set_key
      @klass = self.class.to_s.demodulize.downcase
    end

    def call_api
      @base_url = @base + @url
      resp = RestClient.get @base_url, @auth
      @json = JSON.parse(resp)
    end

    def get_week(week)
      if week.present? && week.is_a?(String) && week.to_time.is_a?(Time)
        week_number = week.to_time.to_i / 604800
      else
        week_number = Time.now.to_i / 604800
      end
      week = "&week_reference=#{week_number}"
    end

    # universal methods
    # all and find are the only universal methods for now

    def all(options={})
      # Options hash is for pagination
      # valid options are "page" and "per_page"
      @url = "#{@klass}.json" + apply_filters(options)
      call_api
    end

    def find(id)
      @url = "#{@klass}/#{id}.json"
      call_api
    end

    private

    def set_key
      @user = ENV["CHURCH_METRICS_USER"] || Rails.configuration.church_metrics_user
      @key = ENV["CHURCH_METRICS_KEY"] || Rails.configuration.church_metrics_api_key
      @auth = {:"X-Auth-User"=> @user, :"X-Auth-Key"=> @key}
    end

    def apply_filters(options)
      if options.present?
        filters = "?#{options.to_query}"
      else
        filters = ""
      end
      filters
    end

  end
end
