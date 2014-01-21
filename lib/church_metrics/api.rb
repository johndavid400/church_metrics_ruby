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
      @resp = RestClient.get @base_url, @auth
      @json = JSON.parse(@resp)
    end

    # universal methods

    def all(options={})
      # Options hash is for pagination
      # valid options are "page" and "per_page"
      @url = "#{@klass}.json" + pagination(options)
      call_api
    end

    def find(id)
      @url = "#{@klass}/#{id}.json"
      call_api
    end

    private

    def set_key
      @user = ENV["CHURCH_METRICS_USER"]
      @key = ENV["CHURCH_METRICS_KEY"]
      @auth = {:"X-Auth-User"=> @user, :"X-Auth-Key"=> @key}
    end

    def pagination(options)
      page = "page=#{options[:page]}" if options[:page].present?
      per_page = "per_page=#{options[:per_page]}" if options[:per_page].present?
      if page && per_page
        pagination = "?#{page}&#{per_page}"
      elsif page
        pagination = "?#{page}"
      elsif per_page
        pagination = "?#{per_page}"
      else
        pagination = ""
      end
      pagination
    end

  end
end
